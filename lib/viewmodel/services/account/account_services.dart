import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices {
  void logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    if (context.mounted) {
      Utils.showDialog(
        context,
        () async {
          pref
              .setBool('isLogedin', false)
              .then((value) => Get.offAllNamed(RoutesName.login));
        },
        DialogType.question,
        "Logout",
        "Are you want to logout?",
      );
    }
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
      seedColor: const Color(0xff2096C7),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static final ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff2096C7),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
