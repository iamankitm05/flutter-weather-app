import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/routes/app_router.dart';
import 'package:weather_app/config/themes/app_themes.dart';
import 'package:weather_app/core/utils/di_injector.dart';
import 'package:weather_app/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      bloc: getIt<AppThemeCubit>(),
      builder: (context, state) {
        return MaterialApp.router(
          title: "Weather Forecast",
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: switch (state) {
            AppThemeSystem() => ThemeMode.system,
            AppThemeLight() => ThemeMode.light,
            AppThemeDark() => ThemeMode.dark,
          },
          routerConfig: getIt<AppRouter>().router,
        );
      },
    );
  }
}
