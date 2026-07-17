import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Privacy Policy"),
            _buildSectionBody(
              "At Pathway Education Trust, we value your privacy and are committed to protecting your personal information.",
            ),
            SizedBox(height: AppSize.height(0.03)),
            _buildSectionTitle("Information We Collect"),
            _buildSectionBody(
              "We collect personal information that you provide to us when you register, make an enquiry or use our services.",
            ),
            SizedBox(height: AppSize.height(0.03)),
            _buildSectionTitle("How We Use Information"),
            _buildSectionBody(
              "We use your information to provide and improve our services, communicate with you and for other purposes.",
            ),
            SizedBox(height: AppSize.height(0.03)),
            _buildSectionTitle("Data Protection"),
            _buildSectionBody(
              "We implement security measures to protect your data from unauthorized access or disclosure.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.height(0.015)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppSize.height(0.02),
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildSectionBody(String body) {
    return Text(
      body,
      style: TextStyle(
        fontSize: AppSize.height(0.016),
        color: Colors.grey[800],
        height: 1.5,
      ),
    );
  }
}
