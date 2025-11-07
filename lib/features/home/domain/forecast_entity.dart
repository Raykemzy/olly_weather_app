class ForecastEntity {
  final List<ForecastDay> days;

  ForecastEntity({required this.days});

  @override
  String toString() {
    return 'ForecastEntity(days: $days)';
  }
}

class ForecastDay {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String description;
  final String icon;

  ForecastDay({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.description,
    required this.icon,
  });

  @override
  String toString() {
    return 'ForecastDay(date: $date, minTemp: $minTemp, maxTemp: $maxTemp, condition: $condition, description: $description, icon: $icon)';
  }
}
