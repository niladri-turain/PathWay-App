import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/routes/app_navigation.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "OTP Verification",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.02),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppImagesPng.loginBackground,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
            SizedBox(height: AppSize.height(0.02)),
            // Logo Section
            Column(
              children: [
                Image.asset(
                  AppImagesPng.applogo,
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

            SizedBox(height: AppSize.height(0.05)),

            // Illustration Placeholder
            Icon(
              Icons.vibration, // Replace with actual asset if available
              size: AppSize.height(0.12),
              color: AppColors.green,
            ),

            SizedBox(height: AppSize.height(0.04)),

            // OTP Instruction
            Text(
              "Enter OTP",
              style: TextStyle(
                fontSize: AppSize.height(0.024),
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: AppSize.height(0.01)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.1)),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: AppSize.height(0.016),
                    color: Colors.grey[600],
                  ),
                  children: [
                    const TextSpan(text: "We have sent a 6-digit OTP to\n"),
                    TextSpan(
                      text: "+91 98765 43210",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.height(0.05)),

            // OTP Input Fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                  (index) => _buildOtpBox(context, index == 0 ? "4" : index == 1 ? "7" : index == 2 ? "1" : index == 3 ? "3" : index == 4 ? "9" : "2"),
                ),
              ),
            ),

            SizedBox(height: AppSize.height(0.04)),

            // Resend OTP
            Text(
              "Didn't receive OTP?",
              style: TextStyle(
                fontSize: AppSize.height(0.016),
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: AppSize.height(0.01)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.refresh, color: AppColors.green, size: 18),
                const SizedBox(width: 5),
                Text(
                  "Resend OTP ",
                  style: TextStyle(
                    fontSize: AppSize.height(0.016),
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "(00:28)",
                  style: TextStyle(
                    fontSize: AppSize.height(0.016),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.height(0.04)),

            // Verify OTP Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.08)),
              child: SizedBox(
                width: double.infinity,
                height: AppSize.height(0.06),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.mainNav,
                      (route) => false,
                    );
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
                        "Verify OTP",
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
            ),
            SizedBox(height: AppSize.height(0.04)),
          ],
        ),
      ),
    ],
  ),
);
}

  Widget _buildOtpBox(BuildContext context, String digit) {
    return Container(
      width: AppSize.width(0.12),
      height: AppSize.width(0.12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          digit,
          style: TextStyle(
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
