import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/app.dart';
import 'package:olly_weather_app/core/config/app_config.dart';
import 'package:olly_weather_app/core/config/dio_config.dart';
import 'package:olly_weather_app/core/services/location_service.dart';
import 'package:olly_weather_app/core/services/network_service.dart';
import 'package:olly_weather_app/features/auth/data/auth_repo.dart';
import 'package:olly_weather_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:olly_weather_app/features/home/data/repos/weather_repo.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.loadEnv();
  final dio = DioConfig.getDioInstance();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => NetworkService(dio)),
        RepositoryProvider(create: (context) => AuthRepo()),
        RepositoryProvider(
          create: (context) => WeatherRepo(context.read<NetworkService>()),
        ),
        RepositoryProvider(create: (context) => LocationService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(context.read<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => WeatherCubit(
              context.read<WeatherRepo>(),
              context.read<LocationService>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
