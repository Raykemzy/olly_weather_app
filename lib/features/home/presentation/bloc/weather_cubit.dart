import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/features/home/data/repos/weather_repo.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_state.dart';


class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo _weatherRepo;

  WeatherCubit(this._weatherRepo) : super(WeatherInitial());

  Future<void> getWeather(String city) async {
    emit(WeatherLoading());
    try {
      final response = await _weatherRepo.getWeather(city);
      if (response.success && response.data != null) {
        final WeatherEntity entity = response.data!;
        emit(WeatherSuccess(entity));
      } else {
        emit(WeatherError(response.message));
      }
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
