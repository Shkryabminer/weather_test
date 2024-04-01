import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:weather_test/core/extensions/iterable_extension.dart';
import 'package:weather_test/data/repositories/city_repository.dart';
import 'package:weather_test/domain/models/city_model.dart';
import 'package:weather_test/modules/search_list/search_list_cubit_state.dart';

class SearchListCubit extends Cubit<SearchListState> {
  SearchListCubit(this._cityRepository) : super(SearchListState.defaultState()) {
    getCities();
  }

  final CityRepository _cityRepository;

  getCities({String? sortKey}) async {
    SVProgressHUD.show();
    List<CityModel>? filteredCities;
    var cities = await _cityRepository.getCities();
    if (sortKey != null && sortKey.isNotEmpty) {
      filteredCities = cities?.whereOrNull((p) => p.city.toLowerCase().startsWith(sortKey.toLowerCase()))?.toList();
      emit(state.copyWith(cities: filteredCities ?? []));
    } else {
      emit(state.copyWith(cities: cities));
    }

    SVProgressHUD.dismiss();
  }
}
