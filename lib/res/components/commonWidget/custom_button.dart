import 'package:flutter/material.dart';
import 'package:lms/data/response/status.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String btntitle;
  final Color? backColor;
  final Color? titleColor;
  final Status status;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.btntitle,
    this.backColor,
    this.titleColor,
    this.status = Status.completed,
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
      child: status == Status.loading
          ? CircularProgressIndicator(
              color: theme.colorScheme.onBackground,
            )
          : Text(
              btntitle,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: titleColor,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
