import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/custom_appbar.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
    );
  }
}
