import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';

class FavoriteViewModel extends GetxController {
  RxList favoriteList = [].obs;

  void getTheFavoriteList() async {
    final pref = await SharedPreferences.getInstance();
    favoriteList.value = pref.getStringList("favorite_course") ?? [];
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
      await pref.setStringList("favorite_course", favorite);
      favoriteList.assignAll(favorite);

      final courseDetailsViewModel = Get.find<CourseDetailsViewModel>();
      courseDetailsViewModel.isFavorite.value =
          await courseDetailsViewModel.getIsFavorite(courseName);

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
