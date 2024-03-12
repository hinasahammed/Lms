import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';

import 'package:lms/assets/icons/icons_asset.dart';
import 'package:lms/res/components/accountViewComponents/account_tile.dart';
import 'package:lms/viewmodel/services/account/account_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final auth = FirebaseAuth.instance;

  final _getStorage = GetStorage();
  SharedPreferences? _preferences;

  @override
  void initState() {
    super.initState();
    loadEnrolledCourses();
  }

  Future<void> loadEnrolledCourses() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_preferences == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    var enrolledCourse = _preferences!.getStringList("enrolledCourse") ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi,',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(20),
            AccountTile(
              title: 'Light mode',
              trailing: Switch(
                value: _getStorage.read('isLightMode') ?? false,
                onChanged: (value) {
                  AccountServices().changeThemeMode();
                },
              ),
              imageUrl: IconsAsset.lightMode,
            ),
            const Gap(10),
            // AccountTile(
            //   trailing: const Icon(Icons.arrow_circle_right),
            //   imageUrl: IconsAsset.edit,
            //   onTap: () {
            //     Get.toNamed(RoutesName.editProfile);
            //   },
            //   title: 'Edit profile',
            // ),
            // const Gap(10),
            // AccountTile(
            //   trailing: const Icon(Icons.arrow_circle_right),
            //   imageUrl: IconsAsset.favorite,
            //   onTap: () {
            //     Get.toNamed(RoutesName.favorites);
            //   },
            //   title: 'Favorites',
            // ),
            AccountTile(
              title: 'Total enrolled',
              trailing: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground.withOpacity(.2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  enrolledCourse.length.toString(),
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
              imageUrl: IconsAsset.enrolled,
            ),
            const Gap(10),
            AccountTile(
              onTap: () {
                AccountServices().logout(context);
              },
              title: 'Logout',
              trailing: const Icon(Icons.arrow_circle_right),
              imageUrl: IconsAsset.logout,
            ),
          ],
        ),
      ),
    );
  }
}
