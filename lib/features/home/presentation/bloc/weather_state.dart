import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

enum LoadingState { initial, loading, success, error }

class WeatherState {
  final LoadingState loadingState;

  final LoadingState forecastLoadingState;

  final WeatherEntity? weather;
  final ForecastEntity? forecast;
  final String? error;

  const WeatherState({
    required this.loadingState,
    required this.forecastLoadingState,
    this.weather,
    this.forecast,
    this.error = '',
  });

  WeatherState copyWith({
    LoadingState? loadingState,
    LoadingState? forecastLoadingState,
    WeatherEntity? weather,
    ForecastEntity? forecast,
    String? error,
  }) {
    return WeatherState(
      loadingState: loadingState ?? this.loadingState,
      forecastLoadingState: forecastLoadingState ?? this.forecastLoadingState,
      weather: weather ?? this.weather,
      forecast: forecast ?? this.forecast,
      error: error,
    );
  }

  factory WeatherState.initial() => const WeatherState(
        loadingState: LoadingState.initial,
        forecastLoadingState: LoadingState.initial,
      );
}
