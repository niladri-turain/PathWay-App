import 'package:flutter/material.dart';
import 'core/constant/app_size.dart';
import 'core/routes/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathway Education Trust',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      builder: (context, child) {
        // Initializing AppSize here
        AppSize.init(context);
        return child!;
      },
    );
  }
}
