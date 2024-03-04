import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/main.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/res/components/custom_text_form_field.dart';
import 'package:lms/view/register/register_view.dart';
import 'package:lms/view/reset/reset_password_view.dart';
import 'package:lms/viewmodel/controller/login/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAsset.loginImage),
                CustomTextFormField(
                  controller: loginViewModel.emailController.value,
                  validator: (value) {
                    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    RegExp regExp = RegExp(emailRegex);
                    if (value == null || value.isEmpty) {
                      return "Please enter an email address.";
                    }
                    if (!regExp.hasMatch(value)) {
                      return "Please enter a valid email address.";
                    }
                    return null;
                  },
                  labelText: 'Email address',
                ),
                const Gap(10),
                CustomTextFormField(
                  obscureText: true,
                  controller: loginViewModel.passwordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter an Password";
                    }
                    if (value.length < 6) {
                      return "Password is too short. Minimum length\nis 6 characters.";
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return "Password must contain at least one\nuppercase letter.";
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return "Password must contain at least one\nlowercase letter.";
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return "Password must contain at least one\nnumber.";
                    }
                    return null;
                  },
                  labelText: 'Password',
                ),
                TextButton(
                  onPressed: () {
                    Get.to(ResetPassWordView());
                  },
                  child: const Text('Forget your password?'),
                ),
                SizedBox(
                  width: Get.width,
                  height: 50,
                  child: CustomButton(
                    status: loginViewModel.reqStatusResponse.value,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginViewModel.loginUser(context);
                      }
                    },
                    btntitle: 'Login',
                    backColor: theme.colorScheme.primary,
                    titleColor: theme.colorScheme.onPrimary,
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(RegisterView());
                      },
                      child: const Text('Register'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
