import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/course_card.dart';
import '../../../core/routes/app_navigation.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  // Dummy data for courses
  final List<Map<String, String>> _allCourses = [
    {
      "name": "MD/MS",
      "fullName": "Doctor of Medicine / Master of Surgery",
      "image": AppImagesPng.mbbsCourse,
      "duration": "3 Years",
      "eligibility": "MBBS",
    },
    {
      "name": "MBBS",
      "fullName": "Bachelor of Medicine, Bachelor of Surgery",
      "image": AppImagesPng.mdmsCourse,
      "duration": "5.5 Years",
      "eligibility": "12th Pass (PCB)",
    },
    {
      "name": "MBA",
      "fullName": "Master of Business Administration",
      "image": AppImagesPng.mbaCourse,
      "duration": "2 Years",
      "eligibility": "Graduation",
    },
    {
      "name": "BBA",
      "fullName": "Bachelor of Business Administration",
      "image": AppImagesPng.bbaCourse,
      "duration": "3 Years",
      "eligibility": "12th Pass",
    },
    {
      "name": "BCA",
      "fullName": "Bachelor of Computer Applications",
      "image": AppImagesPng.bcaCourse,
      "duration": "3 Years",
      "eligibility": "12th Pass",
    },
    {
      "name": "B.Tech",
      "fullName": "Bachelor of Technology",
      "image": AppImagesPng.btechCourse,
      "duration": "4 Years",
      "eligibility": "12th Pass (PCM)",
    },


  ];

  List<Map<String, String>> _filteredCourses = [];
  String _selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _filteredCourses = _allCourses;
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredCourses = _allCourses
          .where((course) =>
              course["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              course["fullName"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.mainNav,
              (route) => false,
            );
          },
        ),
        title: Text(
          "Courses",
          style: TextStyle(
            color: Colors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
        child: Column(
          children: [
            SizedBox(height: AppSize.height(0.02)),
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.width(0.08)),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSearch,
                decoration: InputDecoration(
                  hintText: "Search courses...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: AppSize.height(0.018)),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty 
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _filterSearch("");
                        },
                      )
                    : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: AppSize.height(0.015)),
                ),
              ),
            ),
            SizedBox(height: AppSize.height(0.02)),
            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip("All"),
                  _buildCategoryChip("Degree"),
                  _buildCategoryChip("Diploma"),
                  _buildCategoryChip("Online"),
                  _buildCategoryChip("Distance"),
                ],
              ),
            ),
            SizedBox(height: AppSize.height(0.02)),
            // Course List
            Expanded(
              child: _filteredCourses.isEmpty
                  ? Center(child: Text("No courses found", style: TextStyle(fontSize: AppSize.height(0.02))))
                  : ListView.builder(
                      itemCount: _filteredCourses.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final course = _filteredCourses[index];
                        return CourseCard(
                          courseName: course["name"]!,
                          courseFullName: course["fullName"]!,
                          courseImage: course["image"]!,
                          duration: course["duration"]!,
                          eligibility: course["eligibility"]!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: AppSize.width(0.02)),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(0.05),
          vertical: AppSize.height(0.008),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(AppSize.width(0.05)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: AppSize.height(0.016),
          ),
        ),
      ),
    );
  }
}
