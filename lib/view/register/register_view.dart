import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/res/components/commonWidget/custom_button.dart';
import 'package:lms/res/components/commonWidget/custom_text_form_field.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/viewmodel/controller/register/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final registerViewmodel = Get.put(RegisterViewmodel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  height: 320,
                  ImageAsset.loginImage,
                  cacheHeight: 320,
                ),
                CustomTextFormField(
                  textInputAction: TextInputAction.next,
                  controller: registerViewmodel.userNameController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a username.";
                    }
                    // if (value.length < 3) {
                    //   return "Username must be at least 3 characters\nlong.";
                    // }
                    return null;
                  },
                  labelText: 'Username',
                ),
                const Gap(10),
                CustomTextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: registerViewmodel.emailController.value,
                  validator: (value) {
                    // String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    // RegExp regExp = RegExp(emailRegex);
                    if (value == null || value.isEmpty) {
                      return "Please enter an email address.";
                    }
                    // if (!regExp.hasMatch(value)) {
                    //   return "Please enter a valid email address.";
                    // }
                    return null;
                  },
                  labelText: 'Email address',
                ),
                const Gap(10),
                CustomTextFormField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  controller: registerViewmodel.passwordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter an Password";
                    }
                    // if (value.length < 6) {
                    //   return "Password is too short. Minimum length\nis 6 characters.";
                    // }
                    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    //   return "Password must contain at least one\nuppercase letter.";
                    // }
                    // if (!RegExp(r'[a-z]').hasMatch(value)) {
                    //   return "Password must contain at least one\nlowercase letter.";
                    // }
                    // if (!RegExp(r'[0-9]').hasMatch(value)) {
                    //   return "Password must contain at least one\nnumber.";
                    // }
                    return null;
                  },
                  labelText: 'Password',
                ),
                const Gap(10),
                CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  controller: registerViewmodel.confirmPasswordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter an Password";
                    }
                    if (registerViewmodel.passwordController.value.text !=
                        value) {
                      return "Password don't match";
                    }

                    return null;
                  },
                  labelText: 'Confirm Password',
                ),
                const Gap(20),
                SizedBox(
                  width: size.width,
                  height: 50,
                  child: CustomButton(
                    status: registerViewmodel.reqStatusResponse.value,
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   registerViewmodel.registerUser(context);
                      // }
                      if (_formKey.currentState!.validate()) {
                        registerViewmodel.registerUser(context);
                      }
                    },
                    btntitle: 'Register',
                    backColor: theme.colorScheme.primary,
                    titleColor: theme.colorScheme.onPrimary,
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesName.login);
                      },
                      child: const Text('Login'),
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
