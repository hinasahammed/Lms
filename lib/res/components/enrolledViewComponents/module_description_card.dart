import 'package:flutter/material.dart';

class ModuleDescriptionCard extends StatelessWidget {
  final String descriptiontitle;
  final void Function()? onPressed;
  const ModuleDescriptionCard({
    super.key,
    required this.descriptiontitle, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ListTile(
        title: Text(
          descriptiontitle,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        trailing: IconButton(
          onPressed:onPressed,
          icon: Icon(
            Icons.play_circle_outlined,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
