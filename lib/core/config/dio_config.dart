import 'package:dio/dio.dart';

class DioConfig {
  
  DioConfig._();

  static Dio getDioInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    return dio;
  }
}
