import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String btntitle;
  final Color? backColor;
  final Color? titleColor;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.btntitle,
    this.backColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        btntitle,
        style: theme.textTheme.titleLarge!.copyWith(
          color: titleColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
