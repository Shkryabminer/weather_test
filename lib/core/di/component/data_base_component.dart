import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_test/data/entities/city_entity/city_entity_model.dart';
import 'package:weather_test/data/source/local/data_base.dart';

Future<DataBase> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CityEntityModelAdapter());

  return DataBase();
}
