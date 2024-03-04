import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/login/login_view.dart';

class AccountServices {
  final auth = FirebaseAuth.instance;
  void logout(BuildContext context) {
    Utils.showDialog(
      context,
      () async {
        await auth.signOut().then(
              (value) => Get.to(LoginView()),
            );
      },
      DialogType.question,
      "Logout",
      "Are you want to logout?",
    );
  }
}
