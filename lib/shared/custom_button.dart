import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/shared/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.label,
    this.validator,
    this.obscuringCharacter,
    this.obscureText,
    this.controller,
  });
  final Function(String)? onChanged;
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final String? obscuringCharacter;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscuringCharacter: obscuringCharacter ?? "*",
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label ?? ""),
        enabledBorder: borderStyling(),
        focusedBorder: borderStyling(
          boderColor: Colors.cyan,
        ),
        errorBorder: borderStyling(
          boderColor: Colors.red,
        ),
        focusedErrorBorder: borderStyling(
          boderColor: Colors.red,
        ),
      ),
    );
  }
}
