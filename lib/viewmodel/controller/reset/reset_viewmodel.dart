import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/repository/reset/reset_password_repo.dart';
import 'package:lms/utils/utils.dart';

class ResetViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final forgetEmailController = TextEditingController().obs;
  final repo = ResetPasswordRepo();

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void forgetPassword(BuildContext context) async {
    setReqStatusResponse(Status.loading);
    await repo.forgetPassword({"email": forgetEmailController.value.text}).then(
        (value) {
      setReqStatusResponse(Status.completed);
      Get.back();
      forgetEmailController.value.clear();
      if (value['success'] == true) {
        Utils.showSnackbarToast(
          context,
          "forget password link shared on your mail.",
          Icons.check_circle_rounded,
        );
      }
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);
      Utils.showSnackbarToast(
        context,
        "Something went wrong!",
        Icons.check_circle_rounded,
      );
    });
  }
}
