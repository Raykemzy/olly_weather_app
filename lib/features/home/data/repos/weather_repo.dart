import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:olly_weather_app/core/errors/app_error.dart';
import 'package:olly_weather_app/core/services/network_service.dart';
import 'package:olly_weather_app/core/utils/typedefs.dart';
import 'package:olly_weather_app/features/home/data/models/weather_model.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

class WeatherRepo {
  final NetworkService _networkService;

  WeatherRepo(this._networkService);

  Future<BaseResponse<WeatherEntity>> getWeather(String city) async {
    try {
      final response = await _networkService.get<Map<String, dynamic>>(
        'weather',
        queryParameters: {
          'q': city,
          'appid': dotenv.env['OPEN_WEATHER_API_KEY'],
        },
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
}
