import 'package:weather_test/data/entities/city_model_entity.dart';

class CityModel {
  CityModel(
      {required this.city,
      this.city_ascii,
      required this.lat,
      required this.lng,
      this.country,
      this.iso2,
      this.iso3,
      this.admin_name,
      this.capital,
      this.population,
      required this.id});

  final String city;
  final String? city_ascii;
  final double lat;
  final double lng;
  final String? country;
  final String? iso2;
  final String? iso3;
  final String? admin_name;
  final String? capital;
  final String? population;
  final String id;

  CityModelEntity toCityModelEntity() => CityModelEntity(
      city: city,
      lat: lat,
      lng: lng,
      id: id,
      city_ascii: city_ascii,
      capital: capital,
      iso2: iso2,
      iso3: iso3,
      country: country,
      population: population,
      adminName: admin_name);
}
