import 'package:flutter/material.dart';
import 'package:olly_weather_app/common/app_image_widget.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/core/utils/forecast_helper.dart';
import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';

class DailyForecastWidget extends StatelessWidget {
  final ForecastEntity forecast;
  const DailyForecastWidget({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: forecast.days.length,
      itemBuilder: (context, index) {
        final day = forecast.days[index];
        return Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.screenWidth * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ForecastHelper.getDayLabel(day.date),
                    style: AppTextStyles.s16w400.copyWith(color: Colors.white),
                  ),
                  AppNetworkImageWidget(image: day.icon, width: 50, height: 50),
                ],
              ),
            ),
            Text(
              '${day.minTemp.toStringAsFixed(0)}°C - ${day.maxTemp.toStringAsFixed(0)}°C',
              style: AppTextStyles.s16w400.copyWith(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
