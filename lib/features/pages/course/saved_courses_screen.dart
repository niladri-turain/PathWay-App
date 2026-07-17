import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_navigation.dart';

class SavedCoursesScreen extends StatelessWidget {
  const SavedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> savedCourses = [
      {
        "name": "MBA in Finance",
        "duration": "2 Years",
        "fees": "₹ 4.5 Lakhs",
        "image": "https://img.freepik.com/free-photo/business-people-shaking-hands-together_53876-13391.jpg"
      },
      {
        "name": "BCA Admission",
        "duration": "3 Years",
        "fees": "₹ 2.1 Lakhs",
        "image": "https://img.freepik.com/free-vector/gradient-code-syntax-background_23-2149152142.jpg"
      },
      {
        "name": "MCA (Data Science)",
        "duration": "2 Years",
        "fees": "₹ 3.2 Lakhs",
        "image": "https://img.freepik.com/free-photo/technology-concept-with-tablet_23-2148831934.jpg"
      },
      {
        "name": "BBA International",
        "duration": "3 Years",
        "fees": "₹ 5.0 Lakhs",
        "image": "https://img.freepik.com/free-photo/corporate-management-strategy-solution-concept_53876-167088.jpg"
      },
      {
        "name": "B.Tech Computer Science",
        "duration": "4 Years",
        "fees": "₹ 8.5 Lakhs",
        "image": "https://img.freepik.com/free-photo/software-developer-programming-firewall-laptop-screen-office_482257-20092.jpg"
      },
      {
        "name": "Hotel Management",
        "duration": "3 Years",
        "fees": "₹ 3.8 Lakhs",
        "image": "https://img.freepik.com/free-photo/top-view-arrangement-with-food-waiter-uniform_23-2148386185.jpg"
      },
      {
        "name": "MBBS",
        "duration": "5.5 Years",
        "fees": "₹ 25 Lakhs",
        "image": "https://img.freepik.com/free-photo/medical-stethoscope-isolated-white-background_185193-109041.jpg"
      },
      {
        "name": "Law (LLB)",
        "duration": "3 Years",
        "fees": "₹ 1.8 Lakhs",
        "image": "https://img.freepik.com/free-photo/gavel-law-books-justice-concept_1150-17769.jpg"
      },
      {
        "name": "B.Sc Nursing",
        "duration": "4 Years",
        "fees": "₹ 2.5 Lakhs",
        "image": "https://img.freepik.com/free-photo/nurse-holding-patient-hand-hospital_23-2148962450.jpg"
      },
      {
        "name": "Digital Marketing",
        "duration": "1 Year",
        "fees": "₹ 0.8 Lakhs",
        "image": "https://img.freepik.com/free-photo/marketing-strategy-planning-search-statistical-concept_53876-133917.jpg"
      },
    ];

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
          "Saved Courses",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(AppSize.width(0.04)),
        itemCount: savedCourses.length,
        itemBuilder: (context, index) {
          final course = savedCourses[index];
          return _buildSavedCourseCard(context, course);
        },
      ),
    );
  }

  Widget _buildSavedCourseCard(BuildContext context, Map<String, String> course) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.height(0.02)),
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
        children: [
          // Course Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.width(0.03)),
              bottomLeft: Radius.circular(AppSize.width(0.03)),
            ),
            child: Image.network(
              course['image']!,
              width: AppSize.width(0.3),
              height: AppSize.height(0.12),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: AppSize.width(0.3),
                height: AppSize.height(0.12),
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          
          // Course Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppSize.width(0.03)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course['name']!,
                          style: TextStyle(
                            fontSize: AppSize.height(0.018),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.favorite, color: Colors.red, size: 20),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.005)),
                  Text(
                    "Duration: ${course['duration']}",
                    style: TextStyle(
                      fontSize: AppSize.height(0.014),
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.005)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course['fees']!,
                        style: TextStyle(
                          fontSize: AppSize.height(0.016),
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //      Navigator.pushNamed(
                      //       context,
                      //       AppRoutes.courseDetails,
                      //       arguments: {
                      //         'courseName': course['name'],
                      //         'courseImage': course['image']
                      //       }
                      //     );
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: AppSize.width(0.02),
                      //       vertical: AppSize.height(0.005),
                      //     ),
                      //     decoration: BoxDecoration(
                      //       border: Border.all(color: AppColors.green),
                      //       borderRadius: BorderRadius.circular(5),
                      //     ),
                      //     child: Text(
                      //       "View Details",
                      //       style: TextStyle(
                      //         fontSize: AppSize.height(0.012),
                      //         color: AppColors.green,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
