import 'package:olly_weather_app/core/config/app_config.dart';
import 'package:olly_weather_app/core/errors/app_error.dart';
import 'package:olly_weather_app/core/services/network_service.dart';
import 'package:olly_weather_app/core/utils/typedefs.dart';
import 'package:olly_weather_app/features/home/data/models/forecast_response.dart';
import 'package:olly_weather_app/features/home/data/models/weather_model.dart';
import 'package:olly_weather_app/features/home/domain/forcast_mapper.dart';
import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

class WeatherRepo {
  final NetworkService _networkService;

  WeatherRepo(this._networkService);

  final _hourlyForecastInterval = 3;
  final int _forecastDays = 7;

  int _getForecastCount() {
    const maxFreeTierCount = 40;
    final intervalsPerDay = 24 ~/ _hourlyForecastInterval;
    final total = _forecastDays * intervalsPerDay;
    return total > maxFreeTierCount ? maxFreeTierCount : total;
  }

  /// Get current weather for a given latitude and longitude
  Future<BaseResponse<WeatherEntity>> getWeather(
    double latitude,
    double longitude,
  ) async {
    try {
      final apiKey = AppConfig.openWeatherApiKey;
      if (apiKey.isEmpty) {
        throw Exception('OPEN_WEATHER_API_KEY is not set');
      }
      final response = await _networkService.get<Map<String, dynamic>>(
        'weather',
        queryParameters: {'lat': latitude, 'lon': longitude, 'appid': apiKey},
      );

      final model = WeatherModel.fromJson(response.data!);
      return (
        success: true,
        message: 'Weather fetched successfully',
        data: model.toEntity(),
      );
    } catch (e) {
      return AppError.handleError<WeatherEntity>(WeatherEntity.empytyState());
    }
  }

  /// Get 3 hour daily forecast for [_forecastDays] days
  Future<BaseResponse<ForecastEntity>> getForecast(
    double latitude,
    double longitude,
  ) async {
    try {
      final apiKey = AppConfig.openWeatherApiKey;
      final cnt = _getForecastCount();
      if (apiKey.isEmpty) {
        throw Exception('OPEN_WEATHER_API_KEY is not set');
      }
      final response = await _networkService.get<Map<String, dynamic>>(
        'forecast',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
          'cnt': cnt,
        },
      );
      final model = ForecastResponse.fromJson(response.data!);
      return (
        success: true,
        message: 'Forecast fetched successfully',
        data: model.toEntity(),
      );
    } catch (e) {
      return AppError.handleError<ForecastEntity>(ForecastEntity(days: []));
    }
  }
}
