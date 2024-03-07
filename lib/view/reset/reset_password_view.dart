import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/main.dart';
import 'package:lms/res/components/commonWidget/custom_button.dart';
import 'package:lms/res/components/commonWidget/custom_text_form_field.dart';
import 'package:lms/viewmodel/controller/reset/reset_viewmodel.dart';

class ResetPassWordView extends StatelessWidget {
  ResetPassWordView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final resetViewModel = Get.put(ResetViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAsset.forgotPassword),
                Text(
                  'Enter your email and we will send you a password reset link',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  controller: resetViewModel.forgetEmailController.value,
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
                const Gap(20),
                SizedBox(
                  width: Get.width,
                  height: 50,
                  child: CustomButton(
                    status: resetViewModel.reqStatusResponse.value,
                    btntitle: 'Reset Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        resetViewModel.forgetPassword(context);
                      }
                    },
                    backColor: theme.colorScheme.primary,
                    titleColor: theme.colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
