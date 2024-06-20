import 'dart:io';

import 'package:http/http.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/data/models/weather_model.dart';

class OpenWeatherRepository {
  final _client = Client();

  Future<Either<String, WeatherModel>> getCurrentWeatherData(
      String cityName) async {
    try {
      const appId = "";
      final res = await _client.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?$cityName&appid=$appId"),
      );

      if (res.statusCode == HttpStatus.ok) {
        return right(WeatherModel());
      }
      return left("Opps! Somthing went wrong, Failed to load forecast!");
    } catch (_) {
      return left("Opps! Somthing went wrong, Failed to load forecast!");
    }
  }
}
