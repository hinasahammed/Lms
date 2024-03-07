import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/login/login_view.dart';

class ResetViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final forgetEmailController = TextEditingController().obs;
  final auth = FirebaseAuth.instance;

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void forgetPassword(BuildContext context) async {
    try {
      setReqStatusResponse(Status.loading);

      await auth
          .sendPasswordResetEmail(
        email: forgetEmailController.value.text,
      )
          .then((value) {
        setReqStatusResponse(Status.completed);

        Get.offAll(() => LoginView());
        Utils.showSnackbarToast(
          context,
          "Your password reset link send to your email",
          Icons.check_circle_rounded,
        );
      });
    } catch (e) {
      setReqStatusResponse(Status.error);
      if (context.mounted) {
        Utils.showSnackbarToast(
          context,
          "Something went wrong!",
          Icons.error,
        );
      }
    }
  }
}
