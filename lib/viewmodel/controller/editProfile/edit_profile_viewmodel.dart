import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/repository/editProfile/edit_profile_repo.dart';
import 'package:lms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileViewModel extends GetxController {
  final userNameController = TextEditingController().obs;
  Rx<Status> reqStatusResponse = Status.completed.obs;
  final repo = EditProfileRepo();

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void changeUserName(BuildContext context) async {
    setReqStatusResponse(Status.loading);
    final pref = await SharedPreferences.getInstance();
    final id = pref.getInt("user_id");
    await repo.updateUsername(
      {
        "user_id": id,
        "user_name": userNameController.value.text,
      },
    ).then((value) {
      setReqStatusResponse(Status.completed);
      if (value['success']) {
        Get.back();
        Utils.showSnackbarToast(
          context,
          "User name updated successfully.",
          Icons.check_circle_rounded,
        );
      }
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);
      Utils.showSnackbarToast(
        context,
        "Something went wrong",
        Icons.error,
      );
    });
  }
}
