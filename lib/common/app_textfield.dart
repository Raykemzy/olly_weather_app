import 'package:flutter/material.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/core/utils/validators.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Validator? validator;
  final Widget? underChild;
  final Widget? suffixIcon;
  final bool obscureText;
  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.underChild,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: AppTextStyles.s14w400.copyWith(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle: AppTextStyles.s14w400.copyWith(color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        if (underChild != null)
          Padding(padding: const EdgeInsets.only(top: 10), child: underChild!),
      ],
    );
  }
}
