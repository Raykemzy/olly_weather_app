import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/core/services/location_service.dart';
import 'package:olly_weather_app/core/utils/forecast_helper.dart';
import 'package:olly_weather_app/features/home/data/repos/weather_repo.dart';
import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo _weatherRepo;
  final LocationService _locationService;

  WeatherCubit(this._weatherRepo, this._locationService)
    : super(WeatherState.initial());

  Future<void> triggerWeatherEvents() async {
    final location = await _locationService.getCurrentLocation();
    await getWeather(location.latitude, location.longitude);
    await getForecast(location.latitude, location.longitude);
  }

  Future<void> getWeather(double latitude, double longitude) async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    try {
      final response = await _weatherRepo.getWeather(latitude, longitude);
      if (response.success && response.data != null) {
        final WeatherEntity entity = response.data!;
        emit(
          state.copyWith(weather: entity, loadingState: LoadingState.success),
        );
      } else {
        emit(
          state.copyWith(
            error: response.message,
            loadingState: LoadingState.error,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(error: e.toString(), loadingState: LoadingState.error),
      );
    }
  }

  Future<void> getForecast(double latitude, double longitude) async {
    emit(state.copyWith(forecastLoadingState: LoadingState.loading));
    try {
      final response = await _weatherRepo.getForecast(latitude, longitude);
      if (response.success && response.data != null) {
        final ForecastEntity forecast = response.data!;
        final dailyForecasts = ForecastHelper.getDailyForecasts(forecast.days);
        emit(
          state.copyWith(
            forecast: ForecastEntity(days: dailyForecasts),
            forecastLoadingState: LoadingState.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            error: response.message,
            forecastLoadingState: LoadingState.error,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          forecastLoadingState: LoadingState.error,
        ),
      );
    }
  }
}
