import 'package:flutter/material.dart';
import 'package:olly_weather_app/common/app_image_widget.dart';
import 'package:olly_weather_app/core/extensions/string_extensions.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherEntity weather;
  const WeatherDetails({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.city.capitalizeFirst,
              style: AppTextStyles.s24w800.copyWith(color: Colors.white),
            ),
            Text(
              weather.condition.capitalizeFirst,
              style: AppTextStyles.s14w400.copyWith(color: Colors.white),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Text(
              '${weather.temperatureCelsius.toStringAsFixed(0)}°C',
              style: AppTextStyles.s40w800.copyWith(color: Colors.white),
            ),
            AppNetworkImageWidget(image: weather.iconUrl),
          ],
        ),
      ],
    );
  }
}
