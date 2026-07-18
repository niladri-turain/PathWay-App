import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppImagesPng.splash,
              fit: BoxFit.cover,
            ),
          ),
          // Logo and Text Section
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImagesPng.logo,
                  height: AppSize.height(0.15),
                ),
                SizedBox(height: AppSize.height(0.02)),
                Text(
                  "PATHWAY",
                  style: TextStyle(
                    fontSize: AppSize.height(0.035),
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "EDUCATION TRUST",
                  style: TextStyle(
                    fontSize: AppSize.height(0.018),
                    fontWeight: FontWeight.w600,
                    color: AppColors.green,
                  ),
                ),
                SizedBox(height: AppSize.height(0.015)),
                // Decorative Line and Dot
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 1, width: 40, color: Colors.grey[300]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Container(height: 1, width: 40, color: Colors.grey[300]),
                  ],
                ),
                SizedBox(height: AppSize.height(0.015)),
                Text(
                  "Your Career Starts Here",
                  style: TextStyle(
                    fontSize: AppSize.height(0.02),
                    color: Colors.grey[700],
                    letterSpacing: 0.5,
                  ),
                ),
                // Offset to center the content vertically above the buildings
                SizedBox(height: AppSize.height(0.15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
