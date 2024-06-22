import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/repositories/open_weather_repository.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc(this._openWeatherRepository)
      : super(WeatherForecastInitial()) {
    on<GetWeatherForecast>(_getWeatherForecast);
  }

  final OpenWeatherRepository _openWeatherRepository;

  FutureOr<void> _getWeatherForecast(
    GetWeatherForecast event,
    Emitter<WeatherForecastState> emit,
  ) async {
    emit(WeatherForecastDataLoading());
    final res =
        await _openWeatherRepository.getCurrentWeatherData(query: event.query);

    res.fold(
      (error) {
        emit(WeatherForecastErrorState(error: error));
      },
      (weather) {
        emit(WeatherForecastDataLoaded(weather: weather));
      },
    );
  }
}
