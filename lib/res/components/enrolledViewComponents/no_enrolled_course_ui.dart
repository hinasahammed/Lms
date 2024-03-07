import 'package:flutter/material.dart';
import 'package:lms/assets/images/image_asset.dart';

class NoEnrolledCourseUi extends StatelessWidget {
  const NoEnrolledCourseUi({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(ImageAsset.noFavorite),
        Text(
          'No Enrolled Course Yet!',
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          "You haven't enrolled any course",
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.onBackground.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
