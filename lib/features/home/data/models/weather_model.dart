import 'package:olly_weather_app/core/utils/weather_icon_helper.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';

class WeatherModel {
  final String city;
  final String country;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final String condition;
  final String description;
  final String icon;
  final int conditionId;
  final double windSpeed;

  WeatherModel({
    required this.city,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.condition,
    required this.description,
    required this.icon,
    required this.conditionId,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final weather = (json['weather'] as List).isNotEmpty ? json['weather'][0] : null;
    final main = json['main'] ?? {};
    final wind = json['wind'] ?? {};
    final sys = json['sys'] ?? {};

    return WeatherModel(
      city: json['name'] ?? '',
      country: sys['country'] ?? '',
      temperature: (main['temp'] ?? 0).toDouble(),
      feelsLike: (main['feels_like'] ?? 0).toDouble(),
      humidity: (main['humidity'] ?? 0).toInt(),
      condition: weather?['main'] ?? '',
      description: weather?['description'] ?? '',
      icon: weather?['icon'] ?? '',
      conditionId: weather?['id'] ?? 0,
      windSpeed: (wind['speed'] ?? 0).toDouble(),
    );
  }

  double get tempCelsius => temperature - 273.15;
  double get feelsLikeCelsius => feelsLike - 273.15;

  WeatherEntity toEntity() {
    return WeatherEntity(
      city: city,
      country: country,
      temperatureCelsius: tempCelsius,
      feelsLikeCelsius: feelsLikeCelsius,
      humidity: humidity,
      condition: condition,
      description: description,
      windSpeed: windSpeed,
      iconUrl: WeatherIconHelper.getIconUrl(icon),
    );
  }
}
