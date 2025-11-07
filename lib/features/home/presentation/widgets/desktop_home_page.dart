import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/common/app_button.dart';
import 'package:olly_weather_app/common/app_textfield.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_cubit.dart';
import 'package:olly_weather_app/features/home/presentation/bloc/weather_state.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                spacing: 10,
                children: [
                  Flexible(child: AppTextField(hintText: 'Enter city name')),
                  AppButton(text: 'Search', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 10),
              // BlocBuilder<WeatherCubit, WeatherState>(
              //   builder: (context, state) {
              //     final weather = state is WeatherSuccess
              //         ? state.weather
              //         : null;
              //     if (state is WeatherLoading) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //     return Container(
              //       width: double.infinity,
              //       // margin: const EdgeInsets.all(16),
              //       padding: const EdgeInsets.all(16),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       child: Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Column(
              //                 children: [
              //                   Text('City'),
              //                   Text(weather?.city ?? ''),
              //                 ],
              //               ),
              //               Text('${weather?.temperatureCelsius.toStringAsFixed(2)}°C'),
              //             ],
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
