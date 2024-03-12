import 'dart:async';

import 'package:get/get.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices{

   void isLogedin() {
    Timer(
      const Duration(seconds: 3),
      () {
        checkLogedin();
      },
    );
  }
  
void checkLogedin() async {
  final prefs = await SharedPreferences.getInstance();
  final isLogedin = prefs.getBool('isLogedin') ?? false;
  final isStarted = prefs.getBool('Get_started') ?? false;
  if (isLogedin) {
    Get.offAllNamed(RoutesName.tabBar);
  } else {
    if (isStarted) {
      Get.offAllNamed(RoutesName.login);
    } else {
      Get.offAllNamed(RoutesName.getStarted);
    }
  }
}
}