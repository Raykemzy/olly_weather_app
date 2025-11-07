import 'package:olly_weather_app/gen/assets.gen.dart';

class WeatherWallpaperHelper {
  static String getWallpaper(String mainCondition) {
    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return Assets.images.clearSky.path;
      case 'clouds':
        return Assets.images.cloudySky.path;
      case 'rain':
      case 'drizzle':
      case 'thunderstorm':
        return Assets.images.rain.path;
      case 'snow':
        return Assets.images.snow.path;
      case 'mist':
      case 'fog':
      case 'haze':
        return Assets.images.mist.path;
      default:
        return Assets.images.neutral.path;
    }
  }
}