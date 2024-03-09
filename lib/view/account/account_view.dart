import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:lms/assets/icons/icons_asset.dart';
import 'package:lms/res/components/accountViewComponents/account_tile.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/viewmodel/services/account/account_services.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});
  final auth = FirebaseAuth.instance;
  final _getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const ShimmerList(),
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData ||
              snapshot.data == null ||
              !snapshot.data!.exists) {
            return Center(
              child: Text(
                'No data found!',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            );
          } else {
            var userData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi,\n${userData['userName'].toString().toUpperCase()[0] + userData['userName'].substring(1)}',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    userData['email'],
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onBackground.withOpacity(.5),
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
                  AccountTile(
                    trailing: const Icon(Icons.arrow_circle_right),
                    imageUrl: IconsAsset.edit,
                    onTap: () {
                      Get.toNamed(RoutesName.editProfile);
                    },
                    title: 'Edit profile',
                  ),
                  const Gap(10),
                  AccountTile(
                    trailing: const Icon(Icons.arrow_circle_right),
                    imageUrl: IconsAsset.favorite,
                    onTap: () {
                      Get.toNamed(RoutesName.favorites);
                    },
                    title: 'Favorites',
                  ),
                  const Gap(10),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("user")
                        .doc(auth.currentUser!.uid)
                        .collection('enrolledCourse')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return AccountTile(
                        title: 'Total enrolled',
                        trailing: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                theme.colorScheme.onBackground.withOpacity(.2),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            snapshot.data != null
                                ? snapshot.data!.docs.length.toString()
                                : "",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onBackground,
                            ),
                          ),
                        ),
                        imageUrl: IconsAsset.enrolled,
                      );
                    },
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
            );
          }
        },
      ),
    );
  }
}
