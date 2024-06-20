import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeSystem());

  changeTheme(ThemeMode themeMode) {
    final themeState = switch (themeMode) {
      ThemeMode.system => AppThemeSystem(),
      ThemeMode.light => AppThemeLight(),
      ThemeMode.dark => AppThemeDark(),
    };

    emit(themeState);
  }
}
