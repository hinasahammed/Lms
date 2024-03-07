import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/login/login_view.dart';

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

          Get.to(LoginView());
          Utils.showSnackbarToast(
            context,
            "Account created successfully, now try to login.",
            Icons.check_circle_rounded,
          );
        },
      );
      setReqStatusResponse(Status.completed);
    } on FirebaseAuthException catch (error) {
      setReqStatusResponse(Status.error);
      if (error.code == 'email-already-in-use') {
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            "The email address is already in use by another account.",
            Icons.error,
          );
        }
      } else if (error.code == 'invalid-email') {
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            "The email address is address not valid.",
            Icons.error,
          );
        }
      } else if (error.code == 'operation-not-allowed') {
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            "Something went wrong.",
            Icons.error,
          );
        }
      } else if (error.code == 'weak-password') {
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            "The password is not strong enough.",
            Icons.error,
          );
        }
      } else {
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            "Something went wrong.",
            Icons.error,
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

  @override
  void dispose() {
    super.dispose();
    userNameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
  }
}
