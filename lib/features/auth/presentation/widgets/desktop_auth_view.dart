import 'package:flutter/material.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/mobile_login_view.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/registration_view.dart';

enum DesktopAuthViewType { login, registration }

class DesktopAuthView extends StatelessWidget {
  final DesktopAuthViewType type;
  const DesktopAuthView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: context.screenHeight,
          width: context.screenWidth * 0.6,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Olly Weather 🌤️',
                  style: AppTextStyles.s40w800.copyWith(color: Colors.white),
                ),
                Text(
                  'The best weather app for your home',
                  style: AppTextStyles.s16w400.copyWith(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  type == DesktopAuthViewType.login
                      ? 'Sign up to continue 👉🏽'
                      : 'Login to continue 👉🏽',
                  style: AppTextStyles.s16w400.copyWith(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: context.screenHeight,
          width: context.screenWidth * 0.4,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: type == DesktopAuthViewType.login
              ? LoginView()
              : RegistrationView(),
        ),
      ],
    );
  }
}
