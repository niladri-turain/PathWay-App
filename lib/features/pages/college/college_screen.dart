import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/constant/college_data.dart';
import '../../../core/routes/app_navigation.dart';

class CollegeScreen extends StatefulWidget {
  const CollegeScreen({super.key});

  @override
  State<CollegeScreen> createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = "All";
  final List<String> _filters = ["All", "State", "City", "Approval", "Private", "Govt"];
  List<Map<String, dynamic>> _filteredColleges = [];

  @override
  void initState() {
    super.initState();
    _filteredColleges = CollegeData.colleges;
    _searchController.addListener(_filterColleges);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterColleges);
    _searchController.dispose();
    super.dispose();
  }

  void _filterColleges() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredColleges = CollegeData.colleges.where((college) {
        bool matchesQuery = college["name"].toLowerCase().contains(query) ||
            college["location"].toLowerCase().contains(query);
        
        bool matchesFilter = true;
        if (_selectedFilter == "Private") {
          matchesFilter = college["type"] == "Private";
        } else if (_selectedFilter == "Govt") {
          matchesFilter = college["type"] == "Govt";
        }
        // Additional filter logic for State, City, etc. can be added here

        return matchesQuery && matchesFilter;
      }).toList();
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
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.mainNav,
              (route) => false,
            );
          },
        ),
        title: Text(
          "Colleges",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05), vertical: AppSize.height(0.01)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.width(0.08)),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => _filterColleges(),
                decoration: InputDecoration(
                  hintText: "Search colleges...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: AppSize.height(0.018)),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty 
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _filterColleges();
                        },
                      ) 
                    : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: AppSize.height(0.015)),
                ),
              ),
            ),
          ),

          // Filters
          SizedBox(
            height: AppSize.height(0.06),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedFilter == _filters[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = _filters[index];
                    });
                    _filterColleges();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: AppSize.width(0.03), top: 10, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.04)),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.green : Colors.grey[100],
                      borderRadius: BorderRadius.circular(AppSize.width(0.05)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _filters[index],
                      style: TextStyle(
                        color: isSelected ? AppColors.white : Colors.black87,
                        fontSize: AppSize.height(0.016),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // College List
          Expanded(
            child: _filteredColleges.isEmpty 
              ? Center(child: Text("No colleges found", style: TextStyle(color: Colors.grey, fontSize: AppSize.height(0.018))))
              : ListView.builder(
                  padding: EdgeInsets.all(AppSize.width(0.05)),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _filteredColleges.length,
                  itemBuilder: (context, index) {
                    final college = _filteredColleges[index];
                    return _buildCollegeCard(college);
                  },
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollegeCard(Map<String, dynamic> college) {
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
      child: Padding(
        padding: EdgeInsets.all(AppSize.width(0.03)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // College Image
            Container(
              width: AppSize.width(0.25),
              height: AppSize.width(0.2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                image: DecorationImage(
                  image: AssetImage(college["image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: AppSize.width(0.03)),
            
            // College Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          college["name"],
                          style: TextStyle(
                            fontSize: AppSize.height(0.018),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            college["rating"],
                            style: TextStyle(
                              fontSize: AppSize.height(0.016),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.star, color: Colors.orange, size: 16),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.005)),
                  Text(
                    college["location"],
                    style: TextStyle(
                      fontSize: AppSize.height(0.014),
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.015)),
                  Row(
                    children: (college["tags"] as List).map<Widget>((tag) {
                      return Padding(
                        padding: EdgeInsets.only(right: AppSize.width(0.03)),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: AppSize.height(0.012),
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
