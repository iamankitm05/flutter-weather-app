import 'package:go_router/go_router.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/presentation/views/weather_report_screen.dart';

class AppRouter {
  late GoRouter _router;

  GoRouter get router => _router;

  AppRouter() {
    _router = GoRouter(
      routes: routes(),
    );
  }

  List<RouteBase> routes() {
    return [
      GoRoute(
        path: AppRoutes.weatherReportScreen.path,
        name: AppRoutes.weatherReportScreen.name,
        builder: (context, state) => const WeatherReportScreen(),
      )
    ];
  }
}
