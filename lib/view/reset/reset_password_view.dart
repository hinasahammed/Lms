import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/main.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/res/components/custom_text_form_field.dart';

class ResetPassWordView extends StatelessWidget {
  ResetPassWordView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset'),
      ),
      body: SingleChildScrollView(
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
              const Gap(20),
              CustomButton(
                btntitle: 'Reset Password',
                onPressed: () {
                  _formKey.currentState!.validate();
                },
                backColor: theme.colorScheme.primary,
                titleColor: theme.colorScheme.onPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
