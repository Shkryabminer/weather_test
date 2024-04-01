import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:weather_test/core/extensions/iterable_extension.dart';
import 'package:weather_test/data/repositories/city_repository.dart';
import 'package:weather_test/data/repositories/weather_repository.dart';
import 'package:weather_test/domain/models/city_model.dart';
import 'package:weather_test/domain/models/weather_model.dart';
import 'package:weather_test/modules/weather/weather_state.dart';
import 'package:weather_test/resources/constants.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._cityRepository, this._weatherRepository) : super(WeatherState.defaultState()) {
    initCity();
  }

  final CityRepository _cityRepository;
  final WeatherRepository _weatherRepository;

  initCity() async {
    var city = await _cityRepository.loadCity();
    if (city == null) {
      var cities = (await _cityRepository.getCities())?.toList() ?? [];
      city = cities.firstWhereOrNull((e) => e.city.toLowerCase() == defaultCityName.toLowerCase());
    }

    emit(state.copyWith(city: city));
    setWeather(city);
  }

  setCity(CityModel city) async {
    emit(state.copyWith(city: city));
    setWeather(city);
    _cityRepository.saveCity(city);
  }

  setWeather(CityModel? city) async {
    WeatherModel? weather;
    SVProgressHUD.show();
    try {
      if (city != null) {
        weather = await _weatherRepository.getWeather(city.lat.toString(), city.lng.toString());
      }
    } catch (error) {
      SVProgressHUD.dismiss();
    }
    SVProgressHUD.dismiss();

    emit(state.copyWith(weather: weather ?? WeatherModel()));
  }
}
