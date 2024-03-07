import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static void showDialog(
    BuildContext context,
    void Function()? btnOkOnPress,
    DialogType dialogType,
    String title,
    String desc,
  ) {
    final theme = Theme.of(context);
    AwesomeDialog(
      context: context,
      descTextStyle: theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      ),
      titleTextStyle: theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      ),
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {
        Get.back();
      },
      btnOkOnPress: btnOkOnPress,
    ).show();
  }

  static void showSnackbarToast(
    BuildContext context,
    String message,
    IconData icon,
  ) {
    Flushbar(
      message: message,
      margin: const EdgeInsets.all(8),
      icon: Icon(
        icon,
        size: 28.0,
        color: Colors.blue[300],
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blue[300],
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
