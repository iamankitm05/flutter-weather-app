part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherForecast extends WeatherForecastEvent {
  final String query;

  const GetWeatherForecast({required this.query});
}
