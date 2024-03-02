import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/main.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/res/components/custom_text_form_field.dart';

class ResetPassWordView extends StatelessWidget {
  const ResetPassWordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              controller: TextEditingController(),
              labelText: 'Email address',
              obscureText: false,
            ),
            const Gap(20),
            CustomButton(
              btntitle: 'Reset Password',
              onPressed: () {},
              backColor: theme.colorScheme.primary,
              titleColor: theme.colorScheme.onPrimary,
            )
          ],
        ),
      ),
    );
  }
}
