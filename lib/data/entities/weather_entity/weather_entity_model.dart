import 'package:weather_test/domain/models/weather_model.dart';

class WeatherEntityModel {
  final String? temperature;
  final String? windSpeed;

  WeatherEntityModel({this.temperature, this.windSpeed});

  WeatherModel toWeatherModel() => WeatherModel(temperature: temperature, windSpeed: windSpeed);

  factory WeatherEntityModel.fromJson(Map<String, dynamic> json) => WeatherEntityModel(
      temperature: json['temperature_2m'] != null ? json['temperature_2m']?.toString() : null,
      windSpeed: json['wind_speed_10m'] != null ? json['wind_speed_10m'].toString() : null);
}
