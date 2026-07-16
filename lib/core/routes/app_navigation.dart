import 'package:flutter/material.dart';
import '../../features/pages/main_nav_screen.dart';
import '../../features/pages/splash/splash_screen.dart';
import '../../features/pages/course/course_details.dart';
import '../../features/pages/enquery/enquery_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String mainNav = '/mainNav';
  static const String courseDetails = '/courseDetails';
  static const String enquiry = '/enquiry';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        mainNav: (context) => const MainNavScreen(),
        courseDetails: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return CourseDetails(
            courseName: args['courseName'],
            courseImage: args['courseImage'],
          );
        },
        enquiry: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
          return EnqueryScreen(
            courseName: args?['courseName'],
          );
        },
      };
}
