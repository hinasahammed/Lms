import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/res/routes/routes.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff2096C7),
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

void main() {
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
      getPages: Routes.appRoute(),
    );
  }
}
