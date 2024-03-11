import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/repository/register/register_repo.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/utils/utils.dart';

class RegisterViewmodel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  // final auth = FirebaseAuth.instance;
  // final firestore = FirebaseFirestore.instance;
  final repo = RegisterRepository();

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  //register user with api
  void registerUser(BuildContext context) async {
    setReqStatusResponse(Status.loading);
    await repo.register(
      {
        "username": userNameController.value.text,
        "email": emailController.value.text,
        "password": passwordController.value.text,
        "confirm_password": confirmPasswordController.value.text
      },
    ).then((value) {
      setReqStatusResponse(Status.completed);
      userNameController.value.clear();
      emailController.value.clear();
      passwordController.value.clear();
      confirmPasswordController.value.clear();
      if (value['message'] == "User registered successfully.") {
        Get.toNamed(RoutesName.login);
        Utils.showSnackbarToast(
          context,
          "User registered successfully",
          Icons.check_circle,
        );
      }
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);
      Utils.showSnackbarToast(
        context,
        "Failed",
        Icons.error,
      );
    });
  }

  // void registerUser(BuildContext context) async {
  //   setReqStatusResponse(Status.loading);
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(
  //       email: emailController.value.text,
  //       password: confirmPasswordController.value.text,
  //     )
  //         .then(
  //       (value) {
  //         addUserData();

  //         Get.toNamed(RoutesName.login);
  //         Utils.showSnackbarToast(
  //           context,
  //           "Account created successfully, now try to login.",
  //           Icons.check_circle_rounded,
  //         );
  //       },
  //     );
  //     setReqStatusResponse(Status.completed);
  //   } on FirebaseAuthException catch (error) {
  //     setReqStatusResponse(Status.error);
  //     if (error.code == 'email-already-in-use') {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "The email address is already in use by another account.",
  //           Icons.error,
  //         );
  //       }
  //     } else if (error.code == 'invalid-email') {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "The email address is address not valid.",
  //           Icons.error,
  //         );
  //       }
  //     } else if (error.code == 'operation-not-allowed') {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "Something went wrong.",
  //           Icons.error,
  //         );
  //       }
  //     } else if (error.code == 'weak-password') {
  //       if (context.mounted) {
  //         Utils.showSnackbarToast(
  //           context,
  //           "The password is not strong enough.",
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

  // void addUserData() {
  //   try {
  //     firestore.collection("user").doc(auth.currentUser!.uid).set(
  //       {
  //         "userName": userNameController.value.text,
  //         "email": emailController.value.text,
  //         "uid": auth.currentUser!.uid,
  //       },
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    userNameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
  }
}
