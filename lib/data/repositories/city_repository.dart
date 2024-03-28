import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_test/data/entities/city_model_entity.dart';
import 'package:weather_test/domain/models/city_model.dart';

class CityRepository {
  Future<List<CityModel>?> getCities() async {
    List<CityModel>? cities;
    try {
      var data = await rootBundle.loadString("assets/cities.json");
      var catalogData = json.decode(data);
      var cityEntities = catalogData.map((e) => CityModelEntity.fromJson(e)).toList();
      cities = cityEntities.map((e) => e.toCityModel()).toList();
    } catch (e) {
      debugPrint(e.toString());
    }

    return cities;
  }
}
