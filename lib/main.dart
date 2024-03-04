import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lms/view/getStarted/get_started.dart';
import 'package:lms/view/login/login_view.dart';
import 'package:lms/view/splash/splash_view.dart';
import 'package:lms/view/tabBar/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff2096C7),
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lms',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashView();
          } else {
            if (snapshot.data != null) {
              return const CustomTabBarView();
            } else {
              return FutureBuilder<bool>(
                future: checkIfUserLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    if (snapshot.data!) {
                      return const Getstarted();
                    } else {
                      return LoginView();
                    }
                  } else {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<bool> checkIfUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
