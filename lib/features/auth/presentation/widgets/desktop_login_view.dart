import 'package:flutter/material.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/mobile_login_view.dart';

class DesktopLoginView extends StatelessWidget {
  const DesktopLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: context.screenHeight,
          width: context.screenWidth * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: MobileLoginView(),
        ),
      ],
    );
  }
}