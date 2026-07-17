import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: AppSize.height(1)),
          color: AppColors.light,
          child: Column(
            children: [
              // Green Header Section
              Container(
                padding: EdgeInsets.only(
                  top: AppSize.height(0.06),
                  bottom: AppSize.height(0.04),
                  left: AppSize.width(0.05),
                  right: AppSize.width(0.05),
                ),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.width(0.08)),
                    bottomRight: Radius.circular(AppSize.width(0.08)),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.arrow_back, color: AppColors.white),
                        const Icon(Icons.settings, color: AppColors.white),
                      ],
                    ),
                    SizedBox(height: AppSize.height(0.02)),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: AppSize.width(0.12),
                          backgroundColor: Colors.white24,
                          child: CircleAvatar(
                            radius: AppSize.width(0.11),
                            backgroundImage: const NetworkImage(
                              "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.width(0.05)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Niladri Roy",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppSize.height(0.024),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "niladri@turaingrp.com",
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.8),
                                fontSize: AppSize.height(0.016),
                              ),
                            ),
                            Text(
                              "+91 9876543210",
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.8),
                                fontSize: AppSize.height(0.016),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Profile Options List
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.height(0.02)),
                child: Column(
                  children: [
                    _buildProfileOption(
                      Icons.favorite,
                      "Saved Courses",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.savedCourses);
                      },
                    ),
                    _buildProfileOption(
                      Icons.account_balance,
                      "Applied Colleges",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.appliedColleges);
                      },
                    ),
                    _buildProfileOption(
                      Icons.assignment,
                      "My Enquiries",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.myEnquiries);
                      },
                    ),
                    _buildProfileOption(
                      Icons.notifications,
                      "Notifications",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.notifications);
                      },
                    ),
                    _buildProfileOption(
                      Icons.support_agent,
                      "Contact Support",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.contactSupport);
                      },
                    ),
                    _buildProfileOption(
                      Icons.privacy_tip,
                      "Privacy Policy",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.privacyPolicy);
                      },
                    ),
                    _buildProfileOption(
                      Icons.info,
                      "About Us",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.aboutUs);
                      },
                    ),
                    _buildProfileOption(Icons.logout, "Logout", isLogout: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isLogout = false, VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: isLogout ? Colors.red : AppColors.green,
            size: AppSize.height(0.028),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: AppSize.height(0.018),
              fontWeight: FontWeight.w500,
              color: isLogout ? Colors.red : AppColors.black,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: isLogout ? Colors.red : Colors.grey,
          ),
          onTap: onTap,
        ),
        if (!isLogout)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
            child: Divider(color: Colors.grey[200], height: 1),
          ),
      ],
    );
  }
}
