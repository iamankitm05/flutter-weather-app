import 'package:get_it/get_it.dart';
import 'package:weather_app/config/routes/app_router.dart';
import 'package:weather_app/config/themes/app_theme_cubit/app_theme_cubit.dart';
import 'package:weather_app/data/repositories/open_weather_repository.dart';
import 'package:weather_app/presentation/bloc/weather_forecast_bloc.dart';

final getIt = GetIt.I;

Future<void> initDependencies() async {
  getIt.registerSingleton(AppRouter());
  getIt.registerSingleton(AppThemeCubit());
  getIt.registerFactory(() => OpenWeatherRepository());
  getIt.registerSingleton(WeatherForecastBloc(getIt<OpenWeatherRepository>()));
}
