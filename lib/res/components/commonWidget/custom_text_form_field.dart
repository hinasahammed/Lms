import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
   required this.textInputAction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ? !isVisible : widget.obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      style: theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
              )
            : const SizedBox(),
        filled: true,
        fillColor: theme.colorScheme.onBackground.withOpacity(.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: widget.labelText,
      ),
    );
  }
}
