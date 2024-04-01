import 'package:dio/dio.dart';
import 'package:weather_test/data/entities/weather_entity/weather_entity_model.dart';
import 'package:weather_test/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._dio);
  final Dio _dio;

  Future<WeatherModel?> getWeather(String lat, String lng) async {
    WeatherModel? weather;
    var queryParameters = _getWeatherQueryParameters(lat, lng);
    var response = await _dio.get(
      '/v1/forecast',
      queryParameters: queryParameters,
    );

    if (response != null) {
      try {
        weather = WeatherEntityModel.fromJson(response.data['current']).toWeatherModel();
      } catch (error) {}
    }
    return weather;
  }

  Map<String, dynamic> _getWeatherQueryParameters(String lat, String lng) {
    return {
      'latitude': lat,
      'longitude': lng,
      'current': ['temperature_2m', 'wind_speed_10m']
    };
  }
}
