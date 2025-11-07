import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/common/app_button.dart';
import 'package:olly_weather_app/common/app_layout_builder.dart';
import 'package:olly_weather_app/common/app_textfield.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/features/home/domain/forecast_entity.dart';
import 'package:olly_weather_app/features/home/domain/weather_entity.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_cubit.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_state.dart';
import 'package:olly_weather_app/features/home/presentation/widgets/daily_forecast_widget.dart';
import 'package:olly_weather_app/features/home/presentation/widgets/home_page_scaffold.dart';
import 'package:olly_weather_app/features/home/presentation/widgets/weather_core_details_widget.dart';
import 'package:olly_weather_app/features/home/presentation/widgets/weather_secondary_details_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().triggerWeatherEvents();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Flexible(child: AppTextField(hintText: 'Enter city name')),
                  AppLayoutBuilder(
                    mobile: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    desktop: AppButton(text: 'Search', onPressed: () {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state.loadingState == LoadingState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.loadingState == LoadingState.error) {
                  return Center(
                    child: Text(
                      'Something went wrong',
                      style: AppTextStyles.s16w400.copyWith(color: Colors.white),
                    ),
                  );
                }
                if (state.loadingState == LoadingState.success) {
                  final weather = state.weather as WeatherEntity;
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        WeatherDetails(weather: weather),
                        WeatherSecondaryDetailsWidget(weather: weather),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state.forecastLoadingState == LoadingState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.forecastLoadingState == LoadingState.error) {
                  return Center(
                    child: Text(
                      'Something went wrong',
                      style: AppTextStyles.s16w400.copyWith(color: Colors.white),
                    ),
                  );
                }
                if (state.forecastLoadingState == LoadingState.success) {
                  final forecast = state.forecast as ForecastEntity;
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7-day Forecast',
                          style: AppTextStyles.s20w800.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        DailyForecastWidget(forecast: forecast),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
