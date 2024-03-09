import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  final Widget? trailing;
  final String title;
  final String imageUrl;
  final void Function()? onTap;
  const AccountTile({
    super.key,
    this.trailing,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          width: size.width * .15,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            color: theme.colorScheme.onBackground.withOpacity(.3),
            shape: BoxShape.circle,
            // image: DecorationImage(
            //   image: AssetImage(imageUrl),
            //   fit: BoxFit.contain,
            // ),
          ),
          child: Image.asset(
            height: 100,
            imageUrl,
            fit: BoxFit.contain,
            cacheHeight: 100,
          ),
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
