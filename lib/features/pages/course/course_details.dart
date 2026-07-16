import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/constant/course_data.dart';

import '../../../core/routes/app_navigation.dart';

class CourseDetails extends StatefulWidget {
  final String courseName;
  final String courseImage;

  const CourseDetails({
    super.key,
    required this.courseName,
    required this.courseImage,
  });

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    // Fetch data from constant based on course name
    final data = CourseData.details[widget.courseName] ?? CourseData.details["MBA"]!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Course Details",
          style: TextStyle(
            color: AppColors.black,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: AppColors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Container(
              height: AppSize.height(0.22),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.width(0.04)),
                image: DecorationImage(
                  image: AssetImage(widget.courseImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSize.width(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titles
                  Text(
                    widget.courseName,
                    style: TextStyle(
                      fontSize: AppSize.height(0.026),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    _getFullName(widget.courseName),
                    style: TextStyle(
                      fontSize: AppSize.height(0.018),
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.02)),

                  // Info Icons Row (Duration, Type, Fees)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoIcon(Icons.calendar_today_outlined, data["duration"]),
                      _buildInfoIcon(Icons.access_time, data["type"]),
                      _buildInfoIcon(Icons.account_balance_wallet_outlined, data["fees"]),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.03)),

                  // About Section
                  Text(
                    "About Course",
                    style: TextStyle(
                      fontSize: AppSize.height(0.02),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Text(
                    data["about"],
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.03)),

                  // Curriculum Section (Expandable)
                  Text(
                    "Curriculum",
                    style: TextStyle(
                      fontSize: AppSize.height(0.02),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  ... (data["curriculum"] as List).map((item) {
                    return Container(
                      margin: EdgeInsets.only(bottom: AppSize.height(0.01)),
                      decoration: BoxDecoration(
                        color: AppColors.green.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: AppColors.green,
                          collapsedIconColor: Colors.black54,
                          title: Text(
                            item["semester"],
                            style: TextStyle(
                              fontSize: AppSize.height(0.018),
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: AppSize.width(0.04),
                                right: AppSize.width(0.04),
                                bottom: AppSize.height(0.02),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (item["syllabus"] as List).map<Widget>((subject) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: AppSize.height(0.005)),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.circle, size: 6, color: AppColors.green),
                                        SizedBox(width: AppSize.width(0.02)),
                                        Expanded(
                                          child: Text(
                                            subject,
                                            style: TextStyle(
                                              fontSize: AppSize.height(0.016),
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  SizedBox(height: AppSize.height(0.03)),

                  // Career Opportunities Grid
                  Text(
                    "Career Opportunities",
                    style: TextStyle(
                      fontSize: AppSize.height(0.02),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.015)),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: AppSize.height(0.01),
                      crossAxisSpacing: AppSize.width(0.02),
                    ),
                    itemCount: (data["careers"] as List).length,
                    itemBuilder: (context, index) {
                      final career = data["careers"][index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(AppSize.width(0.025)),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                              border: Border.all(color: Colors.grey[200]!),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.03),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: Icon(
                              _getIconData(career["icon"]),
                              color: AppColors.green,
                              size: AppSize.height(0.03),
                            ),
                          ),
                          SizedBox(height: AppSize.height(0.008)),
                          Text(
                            career["title"],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: AppSize.height(0.011),
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: AppSize.height(0.04)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSize.width(0.05)),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.enquiry,
              arguments: {"courseName": widget.courseName},
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            minimumSize: Size(double.infinity, AppSize.height(0.06)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.width(0.02)),
            ),
          ),
          child: Text(
            "Apply Now",
            style: TextStyle(
              fontSize: AppSize.height(0.02),
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: AppSize.height(0.018), color: Colors.grey[600]),
        SizedBox(width: AppSize.width(0.015)),
        Text(
          text,
          style: TextStyle(
            fontSize: AppSize.height(0.014),
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _getFullName(String shortName) {
    switch (shortName) {
      case "MBA": return "Master of Business Administration";
      case "BBA": return "Bachelor of Business Administration";
      case "BCA": return "Bachelor of Computer Applications";
      case "B.Tech": return "Bachelor of Technology";
      case "MBBS": return "Bachelor of Medicine, Bachelor of Surgery";
      case "MD/MS": return "Doctor of Medicine / Master of Surgery";
      default: return "";
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'business_center': return Icons.business_center;
      case 'trending_up': return Icons.trending_up;
      case 'people': return Icons.people;
      case 'account_balance': return Icons.account_balance;
      case 'sell': return Icons.sell;
      case 'computer': return Icons.computer;
      case 'store': return Icons.store;
      case 'admin_panel_settings': return Icons.admin_panel_settings;
      case 'code': return Icons.code;
      case 'analytics': return Icons.analytics;
      case 'language': return Icons.language;
      case 'dns': return Icons.dns;
      case 'terminal': return Icons.terminal;
      case 'settings_input_component': return Icons.settings_input_component;
      case 'query_stats': return Icons.query_stats;
      case 'cloud_done': return Icons.cloud_done;
      case 'medical_services': return Icons.medical_services;
      case 'content_cut': return Icons.content_cut;
      case 'assignment_ind': return Icons.assignment_ind;
      case 'volunteer_activism': return Icons.volunteer_activism;
      case 'healing': return Icons.healing;
      case 'biotech': return Icons.biotech;
      case 'school': return Icons.school;
      case 'local_hospital': return Icons.local_hospital;
      default: return Icons.star;
    }
  }
}
