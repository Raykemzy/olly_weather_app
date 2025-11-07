import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:olly_weather_app/gen/assets.gen.dart';

class AppConfig {
  /// Loads the correct environment file for local development.
  static Future<void> loadEnv() async {
    if (kIsWeb) {
      String envFile = Assets.configs.aEnv;
      try {
        await dotenv.load(fileName: envFile);
      } catch (e) {
        throw Exception(
          'Failed to load environment file: $envFile. Make sure it exists.',
        );
      }
    }
  }

  /// Retrieves the API_KEY from `dart-define` or `.env` file.
  static String get openWeatherApiKey {
    final apiKey = const String.fromEnvironment(
      'OPEN_WEATHER_API_KEY',
      defaultValue: '',
    );
    if (kIsWeb) {
      return apiKey;
    }
    return dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
  }
}
