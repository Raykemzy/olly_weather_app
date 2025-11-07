import 'package:flutter/material.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blue : Colors.grey,
        foregroundColor: isEnabled ? Colors.white : Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: isLoading ? SizedBox(width: 20, height: 20, child: const CircularProgressIndicator()) : Text(
        text,
        style: AppTextStyles.s16w400.copyWith(color: Colors.white),
      ),
    );
  }
}
