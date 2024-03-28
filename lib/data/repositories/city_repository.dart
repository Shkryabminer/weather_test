import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_test/data/entities/city_model_entity.dart';
import 'package:weather_test/domain/models/city_model.dart';

class CityRepository {
  Future<List<CityModel>?> getCities() async {
    List<CityModel>? cities;
    try {
      var source = await _getSource();
      if (source != null) {
        var cityEntities = source.map((e) => CityModelEntity.fromJson(e)).toList();
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
}
