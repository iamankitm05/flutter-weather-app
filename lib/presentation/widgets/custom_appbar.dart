import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/di_injector.dart';
import 'package:weather_app/config/themes/app_theme_cubit/app_theme_cubit.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return AppBar(
      title: const Text("Weather App"),
      titleSpacing: horizontalPadding,
      actions: [
        BlocBuilder<AppThemeCubit, AppThemeState>(
          bloc: getIt<AppThemeCubit>(),
          builder: (context, state) {
            return DropdownButtonHideUnderline(
              child: DropdownButton(
                value: switch (state) {
                  AppThemeSystem() => ThemeMode.system,
                  AppThemeLight() => ThemeMode.light,
                  AppThemeDark() => ThemeMode.dark,
                },
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text("System"),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text("Light"),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text("Dark"),
                  ),
                ],
                onChanged: (themeMode) {
                  if (themeMode != null) {
                    getIt<AppThemeCubit>().changeTheme(themeMode);
                  }
                },
              ),
            );
          },
        ),
        Gap(horizontalPadding),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
