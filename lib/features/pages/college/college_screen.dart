import 'package:flutter/material.dart';
import '../../../core/constant/app_size.dart';

class CollegeScreen extends StatefulWidget {
  const CollegeScreen({super.key});

  @override
  State<CollegeScreen> createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "College Screen",
          style: TextStyle(fontSize: AppSize.height(0.03)),
        ),
      ),
    );
  }
}
