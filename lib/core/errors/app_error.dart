import 'package:olly_weather_app/core/utils/typedefs.dart';

class AppError implements Exception {
  static BaseResponse<T> handleError<T>(T data) {
    return (success: false, message: 'Something went wrong', data: data);
  }
}
