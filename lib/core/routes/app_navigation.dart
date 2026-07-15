import 'package:flutter/material.dart';
import '../../features/pages/home/home_screen.dart';
import '../../features/pages/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        home: (context) => const HomeScreen(),
      };
}
