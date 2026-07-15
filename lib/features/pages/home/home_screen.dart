import 'package:flutter/material.dart';
import '../../../core/constant/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Screen",
          style: TextStyle(fontSize: AppSize.height(0.03)),
        ),
      ),
    );
  }
}
