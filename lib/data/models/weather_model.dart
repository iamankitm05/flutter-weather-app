import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String? cityName;
  final String? country;
  final List<WeatherForecastData> weatherForecasts;

  const WeatherModel({
    this.cityName,
    this.country,
    this.weatherForecasts = const [],
  });

  @override
  List<Object?> get props => [
        cityName,
        country,
        weatherForecasts,
      ];
}

class WeatherForecastData extends Equatable {
  final String? description;
  final double? temperature;
  final String? icon;
  final DateTime? dateTime;

  const WeatherForecastData({
    this.description,
    this.temperature,
    this.icon,
    this.dateTime,
  });

  @override
  List<Object?> get props => [
        description,
        temperature,
        icon,
        dateTime,
      ];
}
