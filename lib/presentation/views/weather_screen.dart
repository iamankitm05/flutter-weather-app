import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/config/themes/app_colors.dart';
import 'package:weather_app/core/constants/app_images.dart';
import 'package:weather_app/core/utils/di_injector.dart';
import 'package:weather_app/presentation/bloc/weather_forecast_bloc.dart';
import 'package:weather_app/presentation/widgets/custom_appbar.dart';
import 'package:weather_app/presentation/widgets/custom_image.dart';
import 'package:weather_app/presentation/widgets/custom_search_field.dart';
import 'package:weather_app/presentation/widgets/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return Scaffold(
      appBar: const CustomAppbar(),
      body: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        bloc: getIt<WeatherForecastBloc>(),
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Gap(50),
                  Container(
                    width: 600,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: CustomSearchField(
                      controller: TextEditingController(),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          getIt<WeatherForecastBloc>().add(
                            GetWeatherForecast(query: value),
                          );
                        }
                      },
                    ),
                  ),
                  if (state is WeatherForecastInitial)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        children: [
                          const Gap(80),
                          RichText(
                            text: TextSpan(
                              text: "Welcome to ",
                              style: Theme.of(context).textTheme.displayLarge,
                              children: [
                                TextSpan(
                                  text: "Weather App",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: AppColors.deepPurple,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(15),
                          Text(
                            "Stay ahead with a precise 3-hour forecast for any location, up to 5 days ahead.",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Gap(30),
                          Image.asset(
                            AppImages.weatherIconPng,
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  if (state is WeatherForecastDataLoading) ...[
                    const Gap(120),
                    LoadingAnimationWidget.fourRotatingDots(
                      size: 50,
                      color: AppColors.deepPurple,
                    ),
                  ],
                  if (state is WeatherForecastDataLoaded) ...[
                    const Gap(15),
                    // Current Weather :::::::::::::::::::::::::::::::::::::::::::
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          CustomImage(
                            src:
                                "https://openweathermap.org/img/wn/${state.weather.weatherForecasts.firstOrNull?.icon}@4x.png",
                            width: 300,
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                          const Gap(15),
                          Text(
                            "${state.weather.weatherForecasts.firstOrNull?.temperature}° c",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Gap(15),
                          RichText(
                            text: TextSpan(
                                text: state.weather.cityName ?? "NA",
                                style: Theme.of(context).textTheme.titleLarge,
                                children: [
                                  TextSpan(
                                    text: ",  ",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  TextSpan(
                                    text: state.weather.country ?? "NA",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ]),
                          ),
                          const Gap(10),
                          Text(
                            state.weather.weatherForecasts.firstOrNull
                                    ?.description ??
                                "NA",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const Gap(50),
                    // Hourly Forecast :::::::::::::::::::::::::::::::::::::::::::
                    SizedBox(
                      width: double.infinity,
                      height: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            child: Text(
                              "3-hour Forecast 5 days",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          const Gap(15),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.weather.weatherForecasts.length,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                              ),
                              itemBuilder: (context, index) {
                                return WeatherCard(
                                  weatherForecast:
                                      state.weather.weatherForecasts[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (state is WeatherForecastErrorState)
                    Column(
                      children: [
                        const Gap(80),
                        const Icon(
                          Icons.error_outline,
                          size: 80,
                          color: Colors.red,
                        ),
                        const Gap(35),
                        Text(
                          state.error ?? "Opp! Somthing went Wrong",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Colors.blueGrey,
                              ),
                        ),
                        const Gap(15),
                        Text(
                          "Try Again",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  const Gap(50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
