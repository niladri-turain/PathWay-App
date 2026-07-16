import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_navigation.dart';

class CollegeDetails extends StatelessWidget {
  final Map<String, dynamic> college;

  const CollegeDetails({super.key, required this.college});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: AppSize.height(0.3),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(college["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Back Button
                  Positioned(
                    top: AppSize.height(0.05),
                    left: AppSize.width(0.04),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: AppColors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  // Title in Center of AppBar area (simulated)
                  // Positioned(
                  //   top: AppSize.height(0.05),
                  //   left: 0,
                  //   right: 0,
                  //   child: Center(
                  //     child: Text(
                  //       "College Details",
                  //       style: TextStyle(
                  //         color: AppColors.black,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: AppSize.height(0.02),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Heart Icon
                  Positioned(
                    top: AppSize.height(0.05),
                    right: AppSize.width(0.04),
                    child: const Icon(Icons.favorite, color: AppColors.green),
                  ),
                  // Image Paging Indicator (Simulated)
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "1/5",
                        style: TextStyle(color: Colors.white, fontSize: AppSize.height(0.012)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(AppSize.width(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          college["name"],
                          style: TextStyle(
                            fontSize: AppSize.height(0.024),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            college["rating"],
                            style: TextStyle(
                              fontSize: AppSize.height(0.02),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.star, color: AppColors.green, size: 20),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    college["location"],
                    style: TextStyle(
                      fontSize: AppSize.height(0.018),
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.02)),

                  // Tags
                  Row(
                    children: [
                      _buildTag(Icons.verified_outlined, college["tags"][0]),
                      _buildTag(Icons.verified_outlined, college["tags"].length > 1 ? college["tags"][1] : "MCI Approved"),
                      _buildTag(Icons.person_outline, college["type"]),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.03)),

                  // About College
                  Text(
                    "About College",
                    style: TextStyle(
                      fontSize: AppSize.height(0.018),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Text(
                    "${college["name"]} is a top-ranked ${college["type"].toLowerCase()} university known for academic excellence and placements.",
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.03)),

                  // Facilities
                  Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: AppSize.height(0.018),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFacility(Icons.hotel, "Hostel"),
                      _buildFacility(Icons.menu_book, "Library"),
                      _buildFacility(Icons.work_outline, "Placement"),
                      _buildFacility(Icons.restaurant, "Cafeteria"),
                      _buildFacility(Icons.sports_basketball, "Sports"),
                      _buildFacility(Icons.wifi, "Wi-Fi"),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.03)),

                  // Courses Offered
                  Text(
                    "Courses Offered",
                    style: TextStyle(
                      fontSize: AppSize.height(0.018),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.015)),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildCourseTag("MBA"),
                      _buildCourseTag("BCA"),
                      _buildCourseTag("MCA"),
                      _buildCourseTag("BBA"),
                      _buildCourseTag("B.Tech"),
                      _buildCourseTag("+5"),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.12)), // Spacer for bottom buttons
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(0.05),
          vertical: AppSize.height(0.02),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.green),
                  padding: EdgeInsets.symmetric(vertical: AppSize.height(0.015)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Call Now",
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.height(0.018),
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSize.width(0.04)),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pushNamed(
                    context,
                    AppRoutes.enquiry,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  padding: EdgeInsets.symmetric(vertical: AppSize.height(0.015)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Apply Now",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.height(0.018),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(IconData icon, String label) {
    return Padding(
      padding: EdgeInsets.only(right: AppSize.width(0.03)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: AppSize.height(0.014),
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacility(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: AppColors.green, size: 24),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: AppSize.height(0.012),
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildCourseTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppSize.height(0.014),
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
