import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/routes/app_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: AppSize.height(0.1)),
              child: Column(
                children: [
                  Image.asset(
                    AppImagesPng.logo, // Assuming this is the logo
                    height: AppSize.height(0.12),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Text(
                    "PATHWAY",
                    style: TextStyle(
                      fontSize: AppSize.height(0.025),
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    "EDUCATION TRUST",
                    style: TextStyle(
                      fontSize: AppSize.height(0.015),
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Text(
                    "Your Career Starts Here",
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.height(0.05)),

            // Welcome Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.08)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: AppSize.height(0.028),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Login to continue your journey with us",
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.04)),

                  // Mobile Number Field
                  Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              // Flag placeholder
                              const Text("🇮🇳", style: TextStyle(fontSize: 20)),
                              const SizedBox(width: 5),
                              Text(
                                "+91",
                                style: TextStyle(
                                  fontSize: AppSize.height(0.018),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 20),
                            ],
                          ),
                        ),
                        Container(height: 30, width: 1, color: Colors.grey[300]),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Enter your mobile number",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: AppSize.height(0.016),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.02)),
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.green, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        "We will send you an OTP to verify your number",
                        style: TextStyle(
                          fontSize: AppSize.height(0.014),
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.height(0.04)),

                  // Send OTP Button
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.height(0.06),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.otp);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send OTP",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: AppSize.height(0.018),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward, color: AppColors.white, size: 20),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.height(0.04)),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            fontSize: AppSize.height(0.014),
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300])),
                    ],
                  ),

                  SizedBox(height: AppSize.height(0.03)),

                  // Social Logins
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon("https://cdn-icons-png.flaticon.com/512/2991/2991148.png"),
                      const SizedBox(width: 20),
                      _buildSocialIcon("https://cdn-icons-png.flaticon.com/512/733/733547.png"),
                      const SizedBox(width: 20),
                      _buildSocialIcon("https://cdn-icons-png.flaticon.com/512/732/732200.png"),
                    ],
                  ),

                  SizedBox(height: AppSize.height(0.05)),

                  // Terms and Privacy
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "By continuing, you agree to our",
                          style: TextStyle(
                            fontSize: AppSize.height(0.014),
                            color: Colors.grey[600],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                fontSize: AppSize.height(0.014),
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              " and ",
                              style: TextStyle(
                                fontSize: AppSize.height(0.014),
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: AppSize.height(0.014),
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.04)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String url) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        shape: BoxShape.circle,
      ),
      child: Image.network(url, height: 25, width: 25),
    );
  }
}
