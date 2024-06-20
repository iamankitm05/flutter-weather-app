import 'package:get_it/get_it.dart';
import 'package:weather_app/config/routes/app_router.dart';
import 'package:weather_app/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

final getIt = GetIt.I;

Future<void> initDependencies() async {
  getIt.registerSingleton(AppRouter());
  _registerBlocs();
}

void _registerBlocs() {
  getIt.registerSingleton(AppThemeCubit());
}
