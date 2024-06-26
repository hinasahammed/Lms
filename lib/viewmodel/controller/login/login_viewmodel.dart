import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/repository/login/login_repo.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final repo = LoginRepository();

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  //login with api
  void loginUser(BuildContext context) async {
    setReqStatusResponse(Status.loading);
    await repo.login({
      "id": emailController.value.text,
      "password": passwordController.value.text,
    }).then((value) {
      setReqStatusResponse(Status.completed);

      if (value != null) {
        if (value['message'] == "Login successful.") {
          setLogedin(true, value['user_id']);

          Get.offAllNamed(RoutesName.tabBar);
          Utils.showSnackbarToast(
            context,
            "Login successful.",
            Icons.check_circle,
          );
        }
        if (value['message'] == "User not found.") {
          Utils.showSnackbarToast(
            context,
            "User not found.",
            Icons.error,
          );
        }
      }
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);
      if (error.toString() == "No internetNo internet") {
        Utils.showSnackbarToast(
          context,
          "No internet",
          Icons.error,
        );
      } else {
        Utils.showSnackbarToast(
          context,
          "Failed",
          Icons.error,
        );
      }
    });
  }

  void setLogedin(bool value, int userId) async {
    final pref = await SharedPreferences.getInstance();
    final storage = GetStorage();
    storage.write("user_id", userId);
    pref.setBool('isLogedin', value);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }
}
