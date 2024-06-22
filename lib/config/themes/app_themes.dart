import 'package:flutter/material.dart';
import 'package:weather_app/config/themes/app_colors.dart';

abstract final class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightPrimary,
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.light(
      secondary: AppColors.lightSecondary,
      surface: AppColors.lightPrimary,
      onSurface: AppColors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkPrimary,
    colorScheme: const ColorScheme.dark(
      secondary: AppColors.darkSecondary,
      surface: AppColors.darkPrimary,
      onSurface: Colors.white,
    ),
    appBarTheme: _appBarTheme,
  );

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: AppColors.deepPurple,
      foregroundColor: AppColors.white,
    );
  }
}
