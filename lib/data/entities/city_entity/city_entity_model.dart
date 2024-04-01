import 'package:hive_flutter/adapters.dart';
import 'package:weather_test/domain/models/city_model.dart';

part 'city_entity_model.g.dart';

@HiveType(typeId: 0)
class CityEntityModel {
  CityEntityModel(
      {required this.city,
      this.city_ascii,
      required this.lat,
      required this.lng,
      this.country,
      this.iso2,
      this.iso3,
      this.adminName,
      this.capital,
      this.population,
      required this.id});

  @HiveField(0)
  final String city;
  @HiveField(1)
  final String? city_ascii;
  @HiveField(2)
  final double lat;
  @HiveField(3)
  final double lng;
  @HiveField(4)
  final String? country;
  @HiveField(5)
  final String? iso2;
  @HiveField(6)
  final String? iso3;
  @HiveField(7)
  final String? adminName;
  @HiveField(8)
  final String? capital;
  @HiveField(9)
  final String? population;
  @HiveField(10)
  final String id;

  CityModel toCityModel() => CityModel(
      city: city,
      lat: lat,
      lng: lng,
      id: id,
      iso2: iso2,
      iso3: iso3,
      country: country,
      admin_name: adminName,
      capital: capital,
      city_ascii: city_ascii,
      population: population);

  factory CityEntityModel.fromJson(Map<String, dynamic> json) => CityEntityModel(
      city: json['city'],
      lat: json['lat'] == null ? 0 : double.parse(json['lat']),
      lng: json['lng'] == null ? 0 : double.parse(json['lng']),
      id: json['id'] ?? '',
      adminName: json['admin_name'],
      iso2: json['iso2'],
      iso3: json['iso3'],
      country: json['country'],
      capital: json['capital'],
      city_ascii: json['city_ascii'],
      population: json['population']);
}
