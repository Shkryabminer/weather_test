import 'package:flutter/material.dart';
import 'package:weather_test/core/navigation/route_manager.dart';

import 'core/di/dependency_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteManager.instance.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
