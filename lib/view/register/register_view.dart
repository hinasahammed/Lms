import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/res/components/custom_text_form_field.dart';
import 'package:lms/res/routes/routes_name.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(ImageAsset.loginImage),
            CustomTextFormField(
              obscureText: false,
              controller: TextEditingController(),
              labelText: 'Username',
            ),
            const Gap(10),
            CustomTextFormField(
              obscureText: false,
              controller: TextEditingController(),
              labelText: 'Email address',
            ),
            const Gap(10),
            CustomTextFormField(
              obscureText: true,
              controller: TextEditingController(),
              labelText: 'Password',
            ),
            const Gap(10),
            CustomTextFormField(
              obscureText: true,
              controller: TextEditingController(),
              labelText: 'Confirm Password',
            ),
            const Gap(20),
            SizedBox(
              width: Get.width,
              child: CustomButton(
                onPressed: () {},
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
    );
  }
}
