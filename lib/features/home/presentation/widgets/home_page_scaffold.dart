import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/core/utils/weather_wallpaper_helper.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_cubit.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_state.dart';

class HomePageScaffold extends StatelessWidget {
  final Widget child;
  const HomePageScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final wallpaper = WeatherWallpaperHelper.getWallpaper(
          state.weather?.condition ?? 'neutral',
        );
        final childKey = ValueKey(wallpaper);
        return Scaffold(
          body: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: SizedBox.expand(
                  key: childKey,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(wallpaper),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.5),
                        Colors.black.withValues(alpha: 0.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: child
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
