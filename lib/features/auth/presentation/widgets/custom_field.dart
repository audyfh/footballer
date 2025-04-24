import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballer/core/theme/app_colors.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  const CustomField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.secondary, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.secondary, width: 3),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hint is missing!";
        } else {
          return null;
        }
      },
    );
  }
}
