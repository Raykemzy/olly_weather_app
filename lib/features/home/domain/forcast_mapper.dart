import 'package:olly_weather_app/core/utils/weather_icon_helper.dart';
import 'package:olly_weather_app/features/home/data/models/forecast_response.dart';
import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';

extension ForecastMapper on ForecastResponse {
  double _convertToCelsius(double temperature) => temperature - 273.15;
  ForecastEntity toEntity() {
    return ForecastEntity(
      days: daily
          .map(
            (day) => ForecastDay(
              date: day.date,
              minTemp: _convertToCelsius(day.minTemp),
              maxTemp: _convertToCelsius(day.maxTemp),
              condition: day.condition,
              description: day.description,
              icon: WeatherIconHelper.getIconUrl(day.icon),
            ),
          )
          .toList(),
    );
  }
}
