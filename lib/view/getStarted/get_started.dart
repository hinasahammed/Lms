import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/res/components/custom_button.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(ImageAsset.getStarted),
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: Get.width,
                  child: Column(
                    children: [
                      Text(
                        'Nourish Your Inner Skill',
                        style: theme.textTheme.headlineSmall!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Spark your passion, choose a course, and dive deep! Explore knowledge, gain insights, and unlock your potential. Let the journey begin!',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(15),
                      SizedBox(
                        width: Get.width * .6,
                        height: Get.width * .15,
                        child: CustomButton(
                          btntitle: 'Get Started',
                          backColor: theme.colorScheme.primary,
                          titleColor: theme.colorScheme.onPrimary,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
