import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_test/domain/models/city_model.dart';
import 'package:weather_test/modules/weather/weather_cubit.dart';
import 'package:weather_test/modules/weather/weather_state.dart';

import '../../../core/navigation/route_manager.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/background_image.jpeg'), fit: BoxFit.cover),
        gradient: LinearGradient(
            colors: [Color(0xff2E335A), Color(0xff1C1B33)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: SafeArea(
        top: true,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: BlocProvider<WeatherCubit>(
              create: (context) => WeatherCubit(GetIt.I.get(), GetIt.I.get()),
              child: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, weatherState) {
                var cubit = BlocProvider.of<WeatherCubit>(context);
                return GestureDetector(
                  onVerticalDragEnd: (details) {
                    cubit.setWeather(weatherState.city);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: InkWell(
                                  onTap: () async {
                                    var res = await context.router.push(const SearchRoute());
                                    if (res is CityModel) {
                                      cubit.setCity(res);
                                    }
                                  },
                                  child: SvgPicture.asset('assets/images/ic_search.svg')),
                            )),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Column(
                        children: [
                          Text(weatherState.city?.city ?? 'Montreal',
                              style: const TextStyle(
                                fontSize: 34,
                                height: 1,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFFFFFFF),
                              )),
                          Text(weatherState.weather?.temperature ?? '--',
                              style: const TextStyle(
                                fontSize: 96,
                                height: 1,
                                fontWeight: FontWeight.w200,
                                color: Color(0xFFFFFFFF),
                              )),
                          const Text('Wind speed',
                              style: TextStyle(
                                fontSize: 20,
                                height: 1,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF5F5FF),
                              )),
                          Text(
                            '${weatherState.weather?.windSpeed ?? '--'} km/h',
                            style: const TextStyle(
                              fontSize: 20,
                              height: 2,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/images/house.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                );
              }),
            )),
      ),
    );
  }
}
