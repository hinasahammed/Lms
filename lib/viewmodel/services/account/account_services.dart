import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/login/login_view.dart';

class AccountServices {
  final auth = FirebaseAuth.instance;
  void logout(BuildContext context) {
    Utils.showDialog(
      context,
      () async {
        await auth.signOut().then(
              (value) => Get.offAll(() => LoginView()),
            );
      },
      DialogType.question,
      "Logout",
      "Are you want to logout?",
    );
  }

  static final _getStorage = GetStorage();
  final _storageKey = "isLightMode";

  ThemeMode getThemeMode() {
    return isSavedLightMode() ? ThemeMode.light : ThemeMode.dark;
  }

  bool isSavedLightMode() {
    return _getStorage.read(_storageKey) ?? false;
  }

  void saveThemeMode(bool isLightmode) {
    _getStorage.write(_storageKey, isLightmode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedLightMode());
  }
}

class MyThemes {
  static final ThemeData appThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor:  const Color(0xff2096C7),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static final ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor:  const Color(0xff2096C7),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}

