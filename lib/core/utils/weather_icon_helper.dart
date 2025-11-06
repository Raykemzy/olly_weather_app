class WeatherIconHelper {
  static const _baseUrl = 'https://openweathermap.org/img/wn/';

  /// Returns the full icon URL from an OpenWeather icon code.
  /// Example: `10d` -> `https://openweathermap.org/img/wn/10d@2x.png`
  static String getIconUrl(String iconCode) {
    if (iconCode.isEmpty) return '';
    return '$_baseUrl$iconCode@2x.png';
  }
}