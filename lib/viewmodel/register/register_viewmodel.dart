import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/utils/utils.dart';

class RegisterViewmodel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void registerUser(BuildContext context) async {
    setReqStatusResponse(Status.loading);
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: confirmPasswordController.value.text,
      )
          .then(
        (value) {
          addUserData();
          Utils.showAwesomeSnackbar(
            'Success',
            'Account created successfully',
            context,
            ContentType.success,
            110,
          );
          Get.toNamed(RoutesName.login);
        },
      );
      setReqStatusResponse(Status.completed);
    } on FirebaseAuthException catch (error) {
      setReqStatusResponse(Status.error);
      if (error.code == 'email-already-in-use') {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Warning',
            'The email address is already in use by another account.',
            context,
            ContentType.warning,
            110,
          );
        }
      }
      if (error.code == 'invalid-email') {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Warning',
            'The email address is address not valid.',
            context,
            ContentType.warning,
            110,
          );
        }
      }
      if (error.code == 'operation-not-allowed') {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Warning',
            'Something went wrong.',
            context,
            ContentType.warning,
            110,
          );
        }
      }
      if (error.code == 'weak-password') {
        if (context.mounted) {
          Utils.showAwesomeSnackbar(
            'Warning',
            'he password is not strong enough.',
            context,
            ContentType.warning,
            110,
          );
        }
      }
    }
  }

  void addUserData() {
    try {
      firestore.collection("user").doc(auth.currentUser!.uid).set(
        {
          "userName": userNameController.value.text,
          "email": emailController.value.text,
          "uid": auth.currentUser!.uid,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
