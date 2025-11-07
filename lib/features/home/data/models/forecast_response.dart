import 'package:olly_weather_app/features/home/data/models/daily_forecast_model.dart';

class ForecastResponse {
  final List<DailyForecastModel> daily;

  ForecastResponse({
    required this.daily,
  });

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    final dailyList = (json['list'] as List)
        .map((e) => DailyForecastModel.fromJson(e))
        .toList();

    return ForecastResponse(
      daily: dailyList,
    );
  }
}
