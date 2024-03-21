import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteViewModel extends GetxController {
  RxList favoriteList = [].obs;
  void getTheFavoriteList() async {
    final pref = await SharedPreferences.getInstance();
    favoriteList.value = pref.getStringList("favorite_course") ?? [];
  }

  void removeFavoriteItem(BuildContext context, String courseName) async {
    print("ejkfjdfgk");

    final pref = await SharedPreferences.getInstance();
    final favorite = pref.getStringList("favorite_course");
    if (favorite == null || favorite.isEmpty || favorite == []) {
      print("ejkfjdfgk");

      if (context.mounted) {
        Utils.showSnackbarToast(
          context,
          "There is no item to remove",
          Icons.error,
        );
      } else {
        print("ejkfjk");
        favorite!.remove(courseName);
        getTheFavoriteList();
      }
    }
  }
}
