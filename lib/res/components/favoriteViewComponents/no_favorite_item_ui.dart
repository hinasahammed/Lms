import 'package:flutter/material.dart';
import 'package:lms/assets/images/image_asset.dart';

class NoFavoriteItemUi extends StatelessWidget {
  const NoFavoriteItemUi({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(
          width: double.infinity,
          height: 320,
          ImageAsset.noFavorite,
          cacheHeight: 320,
        ),
        Text(
          'No Favorites Yet!',
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          "You haven't marked any favorite",
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.onBackground.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
