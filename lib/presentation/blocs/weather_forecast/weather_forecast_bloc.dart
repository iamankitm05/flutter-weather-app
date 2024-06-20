import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/weather_model.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitial()) {
    on<WeatherForecastEvent>((event, emit) {});
  }
}
