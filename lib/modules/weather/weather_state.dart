import 'package:weather_test/domain/models/city_model.dart';

import '../../domain/models/weather_model.dart';

class WeatherState {
  final CityModel? city;
  final WeatherModel? weather;

  WeatherState({this.city, this.weather});

  factory WeatherState.defaultState() => WeatherState();

  WeatherState copyWith({CityModel? city, WeatherModel? weather}) =>
      WeatherState(city: city ?? this.city, weather: weather ?? this.weather);
}
