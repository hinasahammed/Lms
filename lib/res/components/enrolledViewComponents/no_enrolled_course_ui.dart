import 'package:flutter/material.dart';
import 'package:lms/assets/images/image_asset.dart';

class NoCourseDataUi extends StatelessWidget {
  final String title;
  final String subTitle;
  const NoCourseDataUi(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(ImageAsset.noFavorite),
        Text(
          title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          subTitle,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.onBackground.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
