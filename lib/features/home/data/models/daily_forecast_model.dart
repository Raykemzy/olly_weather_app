class DailyForecastModel {
  final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String description;
  final String icon;
  final int humidity;

  DailyForecastModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.description,
    required this.icon,
    required this.humidity,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    final weather = (json['weather'] as List).first;
    final tempData = json['main'] as Map<String, dynamic>;

    return DailyForecastModel(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      temp: (tempData['temp'] as num).toDouble(),
      minTemp: (tempData['temp_min'] as num).toDouble(),
      maxTemp: (tempData['temp_max'] as num).toDouble(),
      condition: weather['main'] ?? '',
      description: weather['description'] ?? '',
      icon: weather['icon'] ?? '',
      humidity: tempData['humidity'] ?? 0,
    );
  }
}
