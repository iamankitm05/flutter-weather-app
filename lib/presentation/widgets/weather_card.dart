import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/custom_image.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    this.weatherForecast,
  });

  final WeatherForecastData? weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(minWidth: 200),
      child: Column(
        children: [
          CustomImage(
            src:
                "https://openweathermap.org/img/wn/${weatherForecast?.icon}@2x.png",
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          const Gap(10),
          Text(
            "${weatherForecast?.temperature}° c",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Gap(10),
          Text(
            weatherForecast?.dateTime != null
                ? DateFormat("hh:mm a").format(weatherForecast!.dateTime!)
                : "NA",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(10),
          Text(
            weatherForecast?.dateTime != null
                ? DateFormat("dd MMM, yyyy").format(weatherForecast!.dateTime!)
                : "NA",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
