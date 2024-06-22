part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object> get props => [];
}

final class WeatherForecastInitial extends WeatherForecastState {}

final class WeatherForecastDataLoading extends WeatherForecastState {}

final class WeatherForecastDataLoaded extends WeatherForecastState {
  final WeatherModel weather;

  const WeatherForecastDataLoaded({required this.weather});

  @override
  List<Object> get props => [
        weather,
      ];
}

final class WeatherForecastErrorState extends WeatherForecastState {
  final String? error;

  const WeatherForecastErrorState({required this.error});
}
