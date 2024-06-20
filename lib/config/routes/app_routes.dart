enum AppRoutes {
  weatherReportScreen(
    name: "weather_report",
    path: "/",
  );

  final String name;
  final String path;

  const AppRoutes({
    required this.name,
    required this.path,
  });
}
