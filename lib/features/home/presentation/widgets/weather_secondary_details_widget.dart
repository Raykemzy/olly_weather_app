import 'package:flutter/material.dart';
import 'package:olly_weather_app/common/app_layout_builder.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

class WeatherSecondaryDetailsWidget extends StatelessWidget {
  final WeatherEntity weather;
  const WeatherSecondaryDetailsWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder(
      mobile: Wrap(
        spacing: 10,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 10,
        children: _buildWeatherSecondaryDetailsItem(weather, useFlexible: false),
      ),
      desktop: Row(
        spacing: 10,
        children: _buildWeatherSecondaryDetailsItem(weather, useFlexible: true),
      ),
    );
  }

  List<Widget> _buildWeatherSecondaryDetailsItem(WeatherEntity weather, {required bool useFlexible}) {
    final items = [
      _WeatherSecondaryDetailsItem(
        title: 'Feels like',
        value: '${weather.feelsLikeCelsius.toStringAsFixed(1)}°C',
      ),
      _WeatherSecondaryDetailsItem(
        title: 'Humidity',
        value: '${weather.humidity.toStringAsFixed(0)}%',
      ),
      _WeatherSecondaryDetailsItem(
        title: 'Wind Speed',
        value: '${weather.windSpeed.toStringAsFixed(1)} km/h',
      ),
    ];
    
    if (useFlexible) {
      return items.map((item) => Flexible(child: item)).toList();
    }
    return items;
  }
}

class _WeatherSecondaryDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  const _WeatherSecondaryDetailsItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: AppTextStyles.s16w700.copyWith(color: Colors.grey),
          ),
          Text(
            value,
            style: AppTextStyles.s20w800.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
