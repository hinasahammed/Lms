import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/main.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/res/components/custom_text_form_field.dart';
import 'package:lms/res/routes/routes_name.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(ImageAsset.loginImage),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: 'Email address',
            ),
            const Gap(10),
            CustomTextFormField(
              obscureText: true,
              controller: TextEditingController(),
              labelText: 'Password',
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(RoutesName.resetPassword);
              },
              child: const Text('Forget your password?'),
            ),
            SizedBox(
              width: Get.width,
              child: CustomButton(
                onPressed: () {
                  Get.offAllNamed(RoutesName.tabBar);
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
                    Get.toNamed(RoutesName.register);
                  },
                  child: const Text('Register'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
