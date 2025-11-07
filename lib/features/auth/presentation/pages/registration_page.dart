import 'package:flutter/material.dart';
import 'package:olly_weather_app/common/app_layout_builder.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/desktop_auth_view.dart';
import 'package:olly_weather_app/features/auth/presentation/widgets/registration_view.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: AppLayoutBuilder(
        mobile: const RegistrationView(),
        desktop: const DesktopAuthView(type: DesktopAuthViewType.registration),
      ),
    );
  }
}
