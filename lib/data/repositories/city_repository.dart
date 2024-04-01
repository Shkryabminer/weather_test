import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_test/data/entities/city_entity/city_entity_model.dart';
import 'package:weather_test/data/source/local/data_base.dart';
import 'package:weather_test/domain/models/city_model.dart';

class CityRepository {
  CityRepository(this._dataBase);

  final DataBase _dataBase;

  Future<List<CityModel>?> getCities() async {
    List<CityModel>? cities;
    try {
      var source = await _getSource();
      if (source != null) {
        var cityEntities = source.map((e) => CityEntityModel.fromJson(e)).toList();
        cities = List<CityModel>.from(cityEntities.map((e) => e.toCityModel()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return cities;
  }

  Future<dynamic> _getSource() async {
    dynamic? source;
    try {
      var data = await rootBundle.loadString("assets/cities.json");
      source = json.decode(data);
    } catch (error) {
      debugPrint(error.toString());
    }
    return source;
  }

  Future<CityModel?> loadCity() async {
    CityModel? city;
    var savedCity = await _dataBase.loadCity();
    if (savedCity != null) {
      city = savedCity.toCityModel();
    }

    return city;
  }

  Future<void> saveCity(CityModel city) async {
    var cityEntity = city.toCityModelEntity();
    return _dataBase.saveCity(cityEntity);
  }
}
