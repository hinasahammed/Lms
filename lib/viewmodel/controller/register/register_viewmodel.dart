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

  @override
  void dispose() {
    super.dispose();
    userNameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
  }
}
