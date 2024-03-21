import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/models/lms_course_model/lms_course_model.dart';
import 'package:lms/repository/course/course_repository.dart';
import 'package:lms/res/components/courseDetailsComponents/enroll_adding_sheet.dart';
import 'package:lms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailsViewModel extends GetxController {
  Rx<Status> enrolledStatusResponse = Status.completed.obs;
  Rx<Status> reqResponse = Status.completed.obs;
  RxList<LmsCourseModel> courseList = <LmsCourseModel>[].obs;
  List<String> allEnrolledCourse = [];
  RxBool isFavorite = false.obs;

  final emailController = TextEditingController().obs;
  final mobController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final messageController = TextEditingController().obs;

  final repo = CourseRepository();

  void setReqResponse(Status status) {
    reqResponse.value = status;
  }

  void setenrolledStatusResponse(Status status) {
    enrolledStatusResponse.value = status;
  }

  //getCourse data with api
  Future<List<LmsCourseModel>> getCourseData(BuildContext context) async {
    setReqResponse(Status.loading);
    await repo.getCourse().then((value) {
      setReqResponse(Status.completed);
      courseList.clear();
      for (var element in value) {
        courseList.add(
          LmsCourseModel.fromJson(
            element,
          ),
        );
      }
    }).onError((error, stackTrace) {
      setReqResponse(Status.loading);
      Utils.showSnackbarToast(
        context,
        "Failed",
        Icons.error,
      );
    });
    return courseList;
  }

  void enrollNowSheet(BuildContext context, String courseName) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => EnrollAddingSheet(
        courseName: courseName,
      ),
    );
  }

  void enrollCourseNow(BuildContext context) async {
    setenrolledStatusResponse(Status.loading);
    final pref = await SharedPreferences.getInstance();
    final id = pref.getInt("user_id");
    await repo.enrollCourseId({
      "user_id": id,
    }).then((value) {
      setenrolledStatusResponse(Status.completed);
      Get.back();
      Utils.showSnackbarToast(
        context,
        "Thanks for enrolling.",
        Icons.check_circle,
      );
    }).onError((error, stackTrace) {
      setenrolledStatusResponse(Status.error);
    });
  }

  void enrollNow(BuildContext context, String courseName) async {
    final pref = await SharedPreferences.getInstance();
    setenrolledStatusResponse(Status.loading);
    await repo.enrollCourse(
      {
        "email": emailController.value.text,
        "mob": mobController.value.text,
        "name": nameController.value.text,
        "msg": messageController.value.text,
      },
    ).then((value) {
      setenrolledStatusResponse(Status.completed);
      allEnrolledCourse = pref.getStringList("enrolledCourse") ?? [];
      if (!allEnrolledCourse.contains(courseName)) {
        allEnrolledCourse.add(courseName);
      }
      pref.setStringList("enrolledCourse", allEnrolledCourse);
      emailController.value.clear();
      mobController.value.clear();
      nameController.value.clear();
      messageController.value.clear();
      Get.back();
      enrollCourseNow(context);
      if (value['message'] == "thanks") {
        Utils.showSnackbarToast(
          context,
          "Thanks for enrolling.",
          Icons.check_circle,
        );
      }
    }).onError((error, stackTrace) {
      setenrolledStatusResponse(Status.error);
      Utils.showSnackbarToast(
        context,
        "Failed",
        Icons.error,
      );
    });
  }

  void addToFavorite(
      {required String courseName, required BuildContext context}) async {
    final pref = await SharedPreferences.getInstance();
    var favoriteList = pref.getStringList("favorite_course");
    if (favoriteList == null || favoriteList.isEmpty || favoriteList == []) {
      pref.setStringList(
        "favorite_course",
        [
          courseName,
        ],
      );
      isFavorite.value = await getIsFavorite(courseName);
      if (context.mounted) {
        Utils.showSnackbarToast(
            context, "Added to favorite", Icons.check_circle);
      }
    } else {
      if (favoriteList.contains(courseName)) {
        if (context.mounted) {
          Utils.showSnackbarToast(
              context, "Already in your favorite", Icons.check_circle);
        }
      } else {
        favoriteList.add(courseName);
        isFavorite.value = await getIsFavorite(courseName);

        if (context.mounted) {
          Utils.showSnackbarToast(
              context, "Added to favorite", Icons.check_circle);
        }
      }
    }
  }

  Future<bool> getIsFavorite(String courseName) async {
    final pref = await SharedPreferences.getInstance();
    final favList = pref.getStringList("favorite_course");
    if (favList != null) {
      return favList.contains(courseName);
    } else {
      return false;
    }
  }

  void removeFavoriteItem(BuildContext context, String courseName) async {
    final pref = await SharedPreferences.getInstance();
    List<String>? favorite = pref.getStringList("favorite_course");
    if (favorite == null || favorite.isEmpty) {
      if (context.mounted) {
        Utils.showSnackbarToast(
          context,
          "There is no item to remove",
          Icons.error,
        );
      }
    } else {
      favorite.remove(courseName);
      await pref.setStringList(
        "favorite_course",
        favorite,
      );
      isFavorite.value = await getIsFavorite(courseName);
      if (context.mounted) {
        Utils.showSnackbarToast(
          context,
          "Removed from favorites",
          Icons.check_circle,
        );
      }
    }
  }
}
