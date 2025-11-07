import 'package:flutter/material.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/gen/assets.gen.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.darkSky.path),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.4),
                BlendMode.color,
              ),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
