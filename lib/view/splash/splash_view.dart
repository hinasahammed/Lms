import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/assets/images/image_asset.dart';
import 'package:lms/view/getStarted/get_started.dart';
import 'package:lms/view/login/login_view.dart';
import 'package:lms/view/tabBar/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        } else {
          if (snapshot.data != null) {
            return const CustomTabBarView();
          } else {
            return FutureBuilder<bool>(
              future: checkIfUserLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.data ?? false) {
                  return LoginView();
                } else {
                  return const Getstarted();
                }
              },
            );
          }
        }
      },
    );
  }

  Future<bool> checkIfUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('Get_started') ?? false;
  }
}
