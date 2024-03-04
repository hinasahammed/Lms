import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/tabBar/tab_bar_view.dart';

class LoginViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final auth = FirebaseAuth.instance;

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void loginUser(BuildContext context) async {
    setReqStatusResponse(Status.loading);

    try {
      await auth
          .signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      )
          .then(
        (value) {
          setReqStatusResponse(Status.completed);

          Utils.showAwesomeSnackbar(
            'Succes',
            'Login Successfull',
            context,
            ContentType.success,
            110,
          );
          Get.offAll(const CustomTabBarView());
        },
      );
    } on FirebaseAuthException catch (e) {
      setReqStatusResponse(Status.error);

      if (e.code == "wrong-password") {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Failure',
            'The password is invalid for the given email',
            context,
            ContentType.failure,
            110,
          );
        }
      } else if (e.code == "invalid-email") {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Failure',
            'The email address is not valid.',
            context,
            ContentType.failure,
            110,
          );
        }
      } else if (e.code == "user-disabled") {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Failure',
            'the user corresponding to the given email has been disabled.',
            context,
            ContentType.failure,
            110,
          );
        }
      } else if (e.code == "user-not-found") {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Failure',
            'There is no user corresponding to the given email.',
            context,
            ContentType.failure,
            110,
          );
        }
      } else {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Failure',
            'Something went wrong.',
            context,
            ContentType.warning,
            110,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }
}
