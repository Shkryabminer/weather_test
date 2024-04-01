import 'package:get_it/get_it.dart';
import 'package:weather_test/core/di/component/data_base_component.dart';
import 'package:weather_test/data/api/dio_factoy.dart';
import 'package:weather_test/data/repositories/city_repository.dart';
import 'package:weather_test/data/repositories/weather_repository.dart';
import 'package:weather_test/resources/constants.dart';

T get<T extends Object>() => GetIt.I<T>();

Future<void> setupDI() async {
  GetIt.I
    ..registerFactory(() => DioFactory.instance(baseUrl: baseUrl))
    ..registerSingleton(await initDB())
    ..registerFactory(() => CityRepository(GetIt.I.get()))
    ..registerFactory(() => WeatherRepository(GetIt.I.get()));
}
