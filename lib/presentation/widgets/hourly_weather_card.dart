import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      constraints: const BoxConstraints(minWidth: 120),
    );
  }
}