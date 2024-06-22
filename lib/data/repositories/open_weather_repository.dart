import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/app_secret.dart';
import 'package:weather_app/data/models/weather_model.dart';

class OpenWeatherRepository {
  final _client = Client();

  double toDouble(final value) {
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value) ?? 0;
    }
    return 0;
  }

  Future<Either<String, WeatherModel>> getCurrentWeatherData({
    required String query,
  }) async {
    try {
      final res = await _client.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$query&units=metric&appid=$appId"),
      );

      final data = json.decode(res.body);

      if (res.statusCode == HttpStatus.ok) {
        final weather = WeatherModel(
          cityName: data["city"]["name"],
          country: data["city"]["country"],
          weatherForecasts: data["list"] is List
              ? (data["list"] as List).map(
                  (weatherForecast) {
                    final weather = weatherForecast["weather"] is List
                        ? (weatherForecast["weather"] as List).first
                        : null;
                    return WeatherForecastData(
                      description: weather?["description"],
                      icon: weather?["icon"],
                      temperature: weatherForecast["main"]["temp"],
                      dateTime:
                          DateTime.tryParse(weatherForecast["dt_txt"] ?? ""),
                    );
                  },
                ).toList()
              : [],
        );

        return right(weather);
      }

      return left(data["message"]);
    } catch (e) {
      return left(e.toString());
    }
  }
}
