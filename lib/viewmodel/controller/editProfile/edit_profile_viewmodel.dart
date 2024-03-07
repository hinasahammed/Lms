import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/utils/utils.dart';

class EditProfileViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final userNameController = TextEditingController().obs;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void changeUserName(BuildContext context) {
    setReqStatusResponse(Status.loading);
    try {
      firestore.collection("user").doc(auth.currentUser!.uid).update({
        "userName": userNameController.value.text,
      }).then((value) {
        setReqStatusResponse(Status.completed);

        Get.back();
        Utils.showSnackbarToast(
          context,
          "Saved Successfully",
          Icons.check_circle_rounded,
        );
      });
    } catch (e) {
      Utils.showSnackbarToast(
        context,
        "Failed",
        Icons.error,
      );
    }
  }
}
