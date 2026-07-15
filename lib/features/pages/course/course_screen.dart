import 'package:flutter/material.dart';
import '../../../core/constant/app_size.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Course Screen",
          style: TextStyle(fontSize: AppSize.height(0.03)),
        ),
      ),
    );
  }
}
