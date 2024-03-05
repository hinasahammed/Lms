import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lms/assets/icons/icons_asset.dart';
import 'package:lms/res/components/account_tile.dart';
import 'package:lms/res/components/shimmer_list_ui.dart';
import 'package:lms/view/editProfile/edit_profile_view.dart';
import 'package:lms/view/favorite/favorite_view.dart';
import 'package:lms/viewmodel/services/account/account_services.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});
  final auth = FirebaseAuth.instance;
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
                itemBuilder: (context, index) => const ShimmerList());
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
                    'Hi,\n${userData['userName']}',
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
                  const Spacer(),
                  const AccountTile(
                    title: 'Languages',
                    trailing: Icon(Icons.arrow_circle_right),
                    imageUrl: IconsAsset.language,
                  ),
                  AccountTile(
                    title: 'Light mode',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                    imageUrl: IconsAsset.lightMode,
                  ),
                  AccountTile(
                    trailing: const Icon(Icons.arrow_circle_right),
                    imageUrl: IconsAsset.edit,
                    onTap: () {
                      Get.to(const EditProfileView());
                    },
                    title: 'Edit profile',
                  ),
                  AccountTile(
                    trailing: const Icon(Icons.arrow_circle_right),
                    imageUrl: IconsAsset.favorite,
                    onTap: () {
                      Get.to(const FavoriteView());
                    },
                    title: 'Favorites',
                  ),
                  AccountTile(
                    title: 'Total enrolled',
                    trailing: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onBackground.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '4',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    imageUrl: IconsAsset.enrolled,
                  ),
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
