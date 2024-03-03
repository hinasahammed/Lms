import 'package:flutter/material.dart';

import 'package:lms/assets/icons/icons_asset.dart';
import 'package:lms/res/components/account_tile.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              'Hi,\njames',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'james@gmail.com',
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
            const AccountTile(
              title: 'Edit profile',
              trailing: Icon(Icons.arrow_circle_right),
              imageUrl: IconsAsset.edit,
            ),
            const AccountTile(
              title: 'Favorites',
              trailing: Icon(Icons.arrow_circle_right),
              imageUrl: IconsAsset.favorite,
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
            const AccountTile(
              title: 'Logout',
              trailing: Icon(Icons.arrow_circle_right),
              imageUrl: IconsAsset.logout,
            ),
          ],
        ),
      ),
    );
  }
}
