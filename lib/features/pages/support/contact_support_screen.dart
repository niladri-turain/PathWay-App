import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

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
          "Contact Support",
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
          children: [
            // Top Help Card
            Container(
              padding: EdgeInsets.all(AppSize.width(0.05)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.width(0.04)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.headset_mic, color: AppColors.green, size: AppSize.height(0.04)),
                  ),
                  SizedBox(width: AppSize.width(0.04)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "We're here to help!",
                          style: TextStyle(
                            fontSize: AppSize.height(0.02),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: AppSize.height(0.005)),
                        Text(
                          "Reach out to us for any assistance.",
                          style: TextStyle(
                            fontSize: AppSize.height(0.016),
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.height(0.03)),

            // Contact Info Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.width(0.04)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildContactItem(
                    icon: Icons.phone_outlined,
                    title: "+91 98765 43210",
                    subtitle: "Mon - Sat (10 AM - 6 PM)",
                  ),
                  _buildDivider(),
                  _buildContactItem(
                    icon: Icons.email_outlined,
                    title: "support@Pathway.com",
                    subtitle: "We reply within 24 hours",
                  ),
                  _buildDivider(),
                  _buildContactItem(
                    icon: Icons.chat_bubble_outline,
                    title: "Live Chat",
                    subtitle: "Chat with our support team",
                  ),
                  _buildDivider(),
                  _buildContactItem(
                    icon: Icons.location_on_outlined,
                    title: "Pathway Education Trust",
                    subtitle: "123, Education Street, Kolkata, India",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(0.05),
        vertical: AppSize.height(0.02),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.green, size: AppSize.height(0.03)),
          SizedBox(width: AppSize.width(0.05)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSize.height(0.018),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppSize.height(0.005)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppSize.height(0.014),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: AppSize.width(0.15),
      color: Colors.grey[100],
    );
  }
}
