import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/viewmodel/services/splash/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashServices().isLogedin();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: 310,
              width: double.infinity,
              cacheHeight: 310,
              ImageAsset.appLogo,
            ),
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
