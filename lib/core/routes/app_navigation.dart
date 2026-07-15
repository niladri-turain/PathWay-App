import 'package:flutter/material.dart';
import '../../features/pages/main_nav_screen.dart';
import '../../features/pages/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String mainNav = '/mainNav';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        mainNav: (context) => const MainNavScreen(),
      };
}
