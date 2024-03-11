import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/repository/login/login_repo.dart';
import 'package:lms/utils/utils.dart';

class LoginViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final repo = LoginRepository();

  // final auth = FirebaseAuth.instance;

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  //login with api
  void loginUser(BuildContext context) async {
    setReqStatusResponse(Status.loading);
    await repo.login({
      {"id": "k", "password": "aa"}
    }).then((value) {
      setReqStatusResponse(Status.completed);

      print(value);
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);
      Utils.showSnackbarToast(
        context,
        "Failed",
        Icons.error,
      );
    });
  }

  // void loginUser(BuildContext context) async {
  //   setReqStatusResponse(Status.loading);

  //   try {
  //     await auth
  //         .signInWithEmailAndPassword(
  //       email: emailController.value.text,
  //       password: passwordController.value.text,
  //     )
  //         .then(
  //       (value) {
  //         setReqStatusResponse(Status.completed);
  //         Get.offAll(() => const CustomTabBarView());
  //         Utils.showSnackbarToast(
  //           context,
  //           'Login Successfull',
  //           Icons.check_circle_rounded,
  //         );
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     setReqStatusResponse(Status.error);

  //     if (e.code == "wrong-password") {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "The password is invalid for the given email",
  //           Icons.error,
  //         );
  //       }
  //     } else if (e.code == "invalid-email") {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "The email address is not valid.",
  //           Icons.error,
  //         );
  //       }
  //     } else if (e.code == "user-disabled") {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "The user corresponding to the given email has been disabled.",
  //           Icons.error,
  //         );
  //       }
  //     } else if (e.code == "user-not-found") {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "There is no user corresponding to the given email.",
  //           Icons.error,
  //         );
  //       }
  //     } else if (e.code == "invalid-credential") {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "Invalid email or password.",
  //           Icons.error,
  //         );
  //       }
  //     } else {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "Something went wrong.",
  //           Icons.error,
  //         );
  //       }
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }
}
