import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_size.dart';

import '../core/routes/app_navigation.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String courseFullName;
  final String courseImage;
  final String duration;
  final String eligibility;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseFullName,
    required this.courseImage,
    required this.duration,
    required this.eligibility,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.courseDetails,
          arguments: {
            'courseName': courseName,
            'courseImage': courseImage,
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.height(0.015)),
        padding: EdgeInsets.all(AppSize.width(0.03)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.width(0.03)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.width(0.02)),
              child: Image.asset(
                courseImage,
                width: AppSize.width(0.25),
                height: AppSize.height(0.1),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: AppSize.width(0.04)),
            // Course Details
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseName,
                          style: TextStyle(
                            fontSize: AppSize.height(0.02),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          courseFullName,
                          style: TextStyle(
                            fontSize: AppSize.height(0.016),
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: AppSize.height(0.01)),
                        _buildInfoRow("Duration: ", duration),
                        SizedBox(height: AppSize.height(0.005)),
                        _buildInfoRow("Eligibility: ", eligibility),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: AppSize.height(0.018),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppSize.height(0.015),
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: AppSize.height(0.015),
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
