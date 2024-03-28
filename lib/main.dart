import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms/res/routes/routes.dart';
import 'package:lms/viewmodel/services/account/account_services.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lms',
      debugShowCheckedModeBanner: false,
      theme: MyThemes.appThemeData,
      darkTheme: MyThemes.darkThemeData,
      themeMode: AccountServices().getThemeMode(),
      getPages: Routes.appRoute(),
    );
  }
}
