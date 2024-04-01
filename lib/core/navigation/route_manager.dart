import 'package:auto_route/auto_route.dart';

import '../../modules/search_list/view/search_screen.dart';
import '../../modules/weather/view/weather_screen.dart';

part 'route_manager.gr.dart';

@AutoRouterConfig()
class RouteManager extends _$RouteManager {
  RouteManager._();

  static RouteManager instance = RouteManager._();

  @override
  List<AutoRoute> get routes => [AutoRoute(page: WeatherRoute.page, initial: true), AutoRoute(page: SearchRoute.page)];
}
