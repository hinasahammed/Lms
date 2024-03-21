import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/commonWidget/custom_button.dart';
import 'package:lms/res/components/commonWidget/custom_text_form_field.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';

class EnrollAddingSheet extends StatelessWidget {
  final String courseName;
  EnrollAddingSheet({
    super.key,
    required this.courseName,
  });
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    return Obx(
      () => SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enroll the course',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an email address.";
                    }

                    return null;
                  },
                  controller: courseDetailsViewModel.emailController.value,
                  labelText: "Email address",
                  textInputAction: TextInputAction.next,
                ),
                const Gap(10),
                CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter mobile number.";
                    }

                    return null;
                  },
                  controller: courseDetailsViewModel.mobController.value,
                  labelText: "Mobile no:",
                  textInputAction: TextInputAction.next,
                ),
                const Gap(10),
                CustomTextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name.";
                    }

                    return null;
                  },
                  controller: courseDetailsViewModel.nameController.value,
                  labelText: "Name",
                  textInputAction: TextInputAction.next,
                ),
                const Gap(10),
                CustomTextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter message.";
                    }

                    return null;
                  },
                  controller: courseDetailsViewModel.messageController.value,
                  labelText: "Message",
                  textInputAction: TextInputAction.next,
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel"),
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomButton(
                        status:
                            courseDetailsViewModel.enrolledStatusResponse.value,
                        btntitle: "Enroll",
                        backColor: theme.colorScheme.primary,
                        titleColor: theme.colorScheme.onPrimary,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            courseDetailsViewModel.enrollCourseNow(
                              context,
                            );
                          }
                        },
                      ),
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
