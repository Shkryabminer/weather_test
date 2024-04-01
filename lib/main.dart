import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_test/data/repositories/city_repository.dart';
import 'package:weather_test/data/repositories/weather_repository.dart';
import 'package:weather_test/data/source/local/data_base.dart';
import 'package:weather_test/modules/search_list/search_list_cubit.dart';
import 'package:weather_test/modules/weather/view/weather_screen.dart';
import 'package:weather_test/modules/weather/weather_cubit.dart';
import 'package:weather_test/resources/constants.dart';

import 'data/api/dio_factoy.dart';
import 'data/entities/city_entity/city_entity_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CityEntityModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  _repositoryProviders() => [
        RepositoryProvider(create: (context) => DataBase()),
        RepositoryProvider(create: (context) => DioFactory.instance(baseUrl: baseUrl)),
        RepositoryProvider(create: (context) => CityRepository(RepositoryProvider.of(context))),
        RepositoryProvider(
            create: (context) => WeatherRepository(
                  RepositoryProvider.of(context),
                ))
      ];

  _blockProviders() => [
        BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(RepositoryProvider.of(context), RepositoryProvider.of(context))),
        BlocProvider<SearchListCubit>(create: (context) => SearchListCubit(RepositoryProvider.of(context))),
      ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (BuildContext context, Widget? child) {
          return MultiRepositoryProvider(
            providers: _repositoryProviders(),
            child: MultiBlocProvider(
              providers: _blockProviders(),
              child: const GetMaterialApp(
                debugShowCheckedModeBanner: false,
                home: WeatherScreen(),
              ),
            ),
          );
        });
  }
}
