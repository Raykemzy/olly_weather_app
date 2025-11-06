import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherEntity weather;
  WeatherSuccess(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}