import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/res/components/commonWidget/custom_button.dart';
import 'package:lms/res/components/commonWidget/custom_text_form_field.dart';
import 'package:lms/viewmodel/controller/editProfile/edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileViewModel = Get.put(EditProfileViewModel());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Image.asset(ImageAsset.editProfile),
              const Gap(15),
              Text(
                "Change your name!",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
              const Gap(15),
              CustomTextFormField(
                textInputAction: TextInputAction.done,
                controller: editProfileViewModel.userNameController.value,
                labelText: 'Username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a username.";
                  }
                  if (value.length < 3) {
                    return "Username must be at least 3 characters\nlong.";
                  }
                  return null;
                },
              ),
              const Gap(20),
              SizedBox(
                width: Get.width,
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: CustomButton(
                    status: editProfileViewModel.reqStatusResponse.value,
                    btntitle: 'Save',
                    onPressed: () {
                      editProfileViewModel.changeUserName(context);
                    },
                    backColor: theme.colorScheme.primary,
                    titleColor: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
