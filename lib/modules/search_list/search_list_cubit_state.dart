import 'package:weather_test/domain/models/city_model.dart';

class SearchListState {
  final List<CityModel>? cities;

  SearchListState({this.cities});

  SearchListState copyWith({List<CityModel>? cities}) => SearchListState(cities: cities ?? this.cities);

  factory SearchListState.defaultState() => SearchListState();
}
