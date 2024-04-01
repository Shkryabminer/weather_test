import 'package:hive_flutter/adapters.dart';
import 'package:weather_test/data/entities/city_entity/city_entity_model.dart';

class DataBase {
  static const _cityBoxName = 'cityBox';
  static const _keyCity = 'cityKey';

  static final _cityBox = Hive.openBox<CityEntityModel>(_cityBoxName);

  Future<CityEntityModel?> loadCity() async => (await _cityBox).get(_keyCity);

  Future<void> saveCity(CityEntityModel city) async => (await _cityBox).put(_keyCity, city);

  Future<void> clearCity() async => (await _cityBox).clear();
}
