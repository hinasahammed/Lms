import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/main.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/res/components/custom_text_form_field.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Image.asset(ImageAsset.editProfile),
            CustomTextFormField(
              controller: TextEditingController(),
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
            const Gap(15),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: 'Password',
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
              obscureText: true,
            ),
            const Gap(20),
            SizedBox(
              width: Get.width,
              child: CustomButton(
                btntitle: 'Save',
                onPressed: () {},
                backColor: theme.colorScheme.primary,
                titleColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
