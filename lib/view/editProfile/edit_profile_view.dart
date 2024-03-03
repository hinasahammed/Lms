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
              labelText: 'Email address',
            ),
            const Gap(15),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: 'Password',
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
