import 'package:flutter/material.dart';
import 'package:olly_weather_app/common/app_layout_builder.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:olly_weather_app/features/home/presentation/widgets/desktop_home_page.dart';
import 'package:olly_weather_app/features/home/presentation/widgets/mobile_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: AppLayoutBuilder(
        mobile: const MobileHomePage(),
        desktop: const DesktopHomePage(),
      ),
    );
  }
}
