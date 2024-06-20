import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/di_injector.dart';
import 'package:weather_app/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.padding,
  });

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: padding,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(
        children: [
          Text(
            "Weather Forecast",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          BlocBuilder<AppThemeCubit, AppThemeState>(
            bloc: getIt<AppThemeCubit>(),
            builder: (context, state) {
              return DropdownButton(
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
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
