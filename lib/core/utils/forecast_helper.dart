import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';

class ForecastHelper {
  static String getDayLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final forecastDate = DateTime(date.year, date.month, date.day);

    if (forecastDate.isAtSameMomentAs(today)) {
      return 'Today';
    }

    const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekDays[forecastDate.weekday - 1];
  }

  static List<ForecastDay> getDailyForecasts(
    List<ForecastDay> hourlyForecasts,
  ) {
    final Map<String, ForecastDay> dailyMap = {};

    for (var forecast in hourlyForecasts) {
      final dateKey = DateTime(
        forecast.date.year,
        forecast.date.month,
        forecast.date.day,
      ).toString();

      if (!dailyMap.containsKey(dateKey)) {
        dailyMap[dateKey] = forecast;
      }
    }

    return dailyMap.values.toList()..sort((a, b) => a.date.compareTo(b.date));
  }
}
