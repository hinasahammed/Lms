import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/repository/course/course_repository.dart';
import 'package:lms/utils/utils.dart';

class CourseDetailsViewModel extends GetxController {
  // Rx<Status> favoriteStatusResponse = Status.completed.obs;
  // Rx<Status> enrolledStatusResponse = Status.completed.obs;
  Rx<Status> reqResponse = Status.completed.obs;
  // final firestore = FirebaseFirestore.instance;
  // final auth = FirebaseAuth.instance;
  // void setfavoriteStatusResponse(Status status) {
  //   favoriteStatusResponse.value = status;
  // }

  final repo = CourseRepository();

  void setReqResponse(Status status) {
    reqResponse.value = status;
  }

  // void setenrolledStatusResponse(Status status) {
  //   enrolledStatusResponse.value = status;
  // }

  //getCourse data with api
  void getCourseData(BuildContext context) async {
    setReqResponse(Status.loading);
    await repo.getCourse().then((value) {
      setReqResponse(Status.completed);
      print(value);
    }).onError((error, stackTrace) {
      setReqResponse(Status.loading);
      Utils.showSnackbarToast(
        context,
        "Failed",
        Icons.error,
      );
    });
  }

  // void addToFavorites(
  //   BuildContext context,
  //   CourseModel courseData,
  // ) async {
  //   setfavoriteStatusResponse(Status.loading);
  //   try {
  //     final favoritesRef = firestore
  //         .collection("user")
  //         .doc(auth.currentUser!.uid)
  //         .collection("favorites");

  //     final existingFavorite = await favoritesRef
  //         .where('courseTitle', isEqualTo: courseData.courseTitle)
  //         .get();
  //     if (existingFavorite.docs.isEmpty) {
  //       await favoritesRef.add(courseData.toMap()).then((value) {
  //         setfavoriteStatusResponse(Status.completed);
  //         Utils.showSnackbarToast(
  //           context,
  //           'Added to favorited courses',
  //           Icons.check_circle_rounded,
  //         );
  //       });
  //     } else {
  //       setfavoriteStatusResponse(Status.completed);
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           'This course is already in your favorites',
  //           Icons.check_circle_rounded,
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     setfavoriteStatusResponse(Status.error);
  //     if (context.mounted) {
  //       Utils.showSnackbarToast(
  //         context,
  //         'Something went wrong!',
  //         Icons.check_circle_rounded,
  //       );
  //     }
  //   }
  // }

  // void enrollTheCourse(
  //   BuildContext context,
  //   CourseModel courseData,
  // ) async {
  //   setenrolledStatusResponse(Status.loading);
  //   try {
  //     final enrolledref = firestore
  //         .collection("user")
  //         .doc(auth.currentUser!.uid)
  //         .collection("enrolledCourse");

  //     final existingEnrolled = await enrolledref
  //         .where('courseTitle', isEqualTo: courseData.courseTitle)
  //         .get();
  //     if (existingEnrolled.docs.isEmpty) {
  //       await enrolledref.add({
  //         "courseTitle": courseData.courseTitle,
  //         "imageurl": courseData.imageurl,
  //       }).then((value) {
  //         setenrolledStatusResponse(Status.completed);
  //         Utils.showSnackbarToast(
  //           context,
  //           'Successfully enrolled the course',
  //           Icons.check_circle_rounded,
  //         );
  //       });
  //     } else {
  //       setenrolledStatusResponse(Status.completed);
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           'This course is already enrolled',
  //           Icons.check_circle_rounded,
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     setenrolledStatusResponse(Status.error);
  //     if (context.mounted) {
  //       Utils.showSnackbarToast(
  //         context,
  //         'Something went wrong!',
  //         Icons.check_circle_rounded,
  //       );
  //     }
  //   }
  // }
}
