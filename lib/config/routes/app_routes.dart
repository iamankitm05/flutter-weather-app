enum AppRoutes {
  weatherScreen(
    name: "weather",
    path: "/",
  );

  final String name;
  final String path;

  const AppRoutes({
    required this.name,
    required this.path,
  });
}
