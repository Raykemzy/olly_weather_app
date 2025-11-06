class WeatherEntity {
  final String city;
  final String country;
  final double temperatureCelsius;
  final double feelsLikeCelsius;
  final int humidity;
  final String condition;
  final String description;
  final double windSpeed;
  final String iconUrl;

  WeatherEntity({
    required this.city,
    required this.country,
    required this.temperatureCelsius,
    required this.feelsLikeCelsius,
    required this.humidity,
    required this.condition,
    required this.description,
    required this.windSpeed,
    required this.iconUrl,
  });

  factory WeatherEntity.empytyState() => WeatherEntity(
    city: '',
    country: '',
    temperatureCelsius: 0,
    feelsLikeCelsius: 0,
    humidity: 0,
    condition: '',
    description: '',
    windSpeed: 0,
    iconUrl: '',
  );
}
