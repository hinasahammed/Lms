import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/assets/images/image_asset.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.appLogo),
            Text(
              'Lms',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '"Millions of courses.Endless possibilities."',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(10),
            CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
