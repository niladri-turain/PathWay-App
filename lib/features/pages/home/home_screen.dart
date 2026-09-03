import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/explore_card.dart';
import '../../../widgets/item_card.dart';
import '../../../core/routes/app_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with Stack
            Stack(
              clipBehavior: Clip.none,
              children: [
                // 1. First: Inner Image as Background (Green Part)
                Image.asset(
                  AppImagesPng.innerBanner,
                  height: AppSize.height(0.28),
                  width: AppSize.width(1),
                  fit: BoxFit.cover,
                ),

                // 2. Second: Texts and Icons
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.width(0.05),
                      vertical: AppSize.height(0.015),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.notes,
                                color: AppColors.white,
                                size: AppSize.height(0.035)),
                            Icon(Icons.notifications,
                                color: AppColors.white,
                                size: AppSize.height(0.035)),
                          ],
                        ),
                        SizedBox(height: AppSize.height(0.02)),
                        Text(
                          "Hello, Student 👋",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppSize.height(0.015),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Find your dream course\nand build your future",
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.9),
                            fontSize: AppSize.height(0.014),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Third: Banner Image (Admission Card) at the Bottom

                Positioned(
                  bottom: -AppSize.height(0.11),
                  left: AppSize.width(0.05),
                  right: AppSize.width(0.05),
                  child: Container(
                    height: AppSize.height(0.2),
                    decoration: BoxDecoration(
                      color: Colors.transparent,


                      image: const DecorationImage(

                        image: AssetImage(AppImagesPng.banner),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: AppSize.height(0.12)),

            // Explore Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: AppSize.height(0.022),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.015)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExploreCard(
                        icon: Icons.menu_book,
                        label: "Courses",
                        onTap: () => Navigator.pushNamed(context, AppRoutes.course),
                      ),
                      ExploreCard(
                        icon: Icons.account_balance,
                        label: "Colleges",
                        onTap: () => Navigator.pushNamed(context, AppRoutes.college),
                      ),
                      ExploreCard(
                        icon: Icons.edit_document,
                        label: "Enquiry",
                        onTap: () => Navigator.pushNamed(context, AppRoutes.enquiry),
                      ),
                      ExploreCard(
                        icon: Icons.phone_android,
                        label: "Contact",
                        onTap: () => Navigator.pushNamed(context, AppRoutes.contactSupport),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.height(0.03)),

            // Popular Courses
            _buildHeader("Popular Courses", () {
              Navigator.pushNamed(context, AppRoutes.course);
            }),
            SizedBox(height: AppSize.height(0.015)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: AppSize.width(0.05), bottom: 10),
              child: const Row(
                children: [
                  ItemCard(
                    title: "MD/MS",
                    subtitle: "2 Years",
                    imagePath: AppImagesPng.mba,
                  ),
                  ItemCard(
                    title: "MBBS",
                    subtitle: "3 Years",
                    imagePath: AppImagesPng.bca,
                  ),
                  ItemCard(
                    title: "B.TECH",
                    subtitle: "2 Years",
                    imagePath: AppImagesPng.mca,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.height(0.02)),

            // Top Courses Category
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              child: Row(
                children: [
                  const Icon(Icons.school, color: Colors.orange, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    "Top Courses Category",
                    style: TextStyle(
                      fontSize: AppSize.height(0.022),
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.height(0.015)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: AppSize.width(0.05), bottom: 10),
              child: Row(
                children: [
                  _buildCategoryCard("MD/MS"),
                  _buildCategoryCard("M.B.B.S"),
                  _buildCategoryCard("BDS"),
                  _buildCategoryCard("B.Tech"),
                  _buildCategoryCard("MBA"),
                  _buildCategoryCard("BBA"),
                ],
              ),
            ),
            SizedBox(height: AppSize.height(0.05)),

            // Admission Guidance Section
            _buildAdmissionGuidance(),

            SizedBox(height: AppSize.height(0.03)),

            // Career Counselling Section
            _buildCareerCounselling(),

            SizedBox(height: AppSize.height(0.05)),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerCounselling() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Career Counselling",
            style: TextStyle(
              fontSize: AppSize.height(0.022),
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: AppSize.height(0.015)),
          Container(
            padding: EdgeInsets.all(AppSize.width(0.04)),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Career Counselor in Kolkata Provides Expert Career Counseling",
                  style: TextStyle(
                    fontSize: AppSize.height(0.018),
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                  ),
                ),
                Divider(color: AppColors.green.withOpacity(0.3), thickness: 1),
                SizedBox(height: AppSize.height(0.01)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: AppSize.height(0.014),
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text: "Short Description: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            "Pathway Education Trust offers comprehensive career counselling services to help individuals identify their strengths, explore career options, and achieve their professional goals. Our experienced counsellors provide personalized guidance through one-on-one sessions, group counselling, and workshops, along with access to valuable resources like job search engines and interview preparation tips.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.height(0.02)),
                const Text(
                  "Highlighted Points:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSize.height(0.01)),
                _buildBulletPoint("Personalized career counselling to identify strengths and weaknesses", ""),
                _buildBulletPoint("One-on-one sessions, group counselling, and workshops available", ""),
                _buildBulletPoint("Comprehensive assessments with over 96% accuracy", ""),
                _buildBulletPoint("Resources provided include job search engines, resume writing tips, and interview preparation advice", ""),
                _buildBulletPoint("Supportive environment to explore career options and set personal goals", ""),
                _buildBulletPoint("Experienced counsellors who are passionate about helping individuals succeed", ""),
                SizedBox(height: AppSize.height(0.02)),
                const Text(
                  "Why Choose Pathway Education Trust:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSize.height(0.01)),
                _buildNumberPoint(1, "Experience and Passion:", "With years of experience, our counsellors are dedicated to helping individuals reach their full potential."),
                _buildNumberPoint(2, "Comprehensive Services:", "We offer a variety of services including one-on-one counselling, group sessions, and workshops to cater to diverse needs."),
                _buildNumberPoint(3, "Resource Availability:", "Gain access to valuable resources such as job search engines and interview preparation tips to support your career journey."),
                _buildNumberPoint(4, "Supportive Environment:", "Our counselling sessions are conducted in a confidential and supportive environment, ensuring comfort and trust."),
                _buildNumberPoint(5, "Personalized Approach:", "We tailor our services to each individual's needs, helping them find the right career path based on their strengths and goals."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberPoint(int index, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$index. ",
            style: TextStyle(
              fontSize: AppSize.height(0.013),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: AppSize.height(0.013),
                  color: Colors.black87,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: " "),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdmissionGuidance() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Admission Guidance",
            style: TextStyle(
              fontSize: AppSize.height(0.022),
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: AppSize.height(0.015)),
          Container(
            padding: EdgeInsets.all(AppSize.width(0.04)),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We are The Best Admission Consultant in Kolkata",
                  style: TextStyle(
                    fontSize: AppSize.height(0.018),
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                  ),
                ),
                Divider(color: AppColors.green.withOpacity(0.3), thickness: 1),
                SizedBox(height: AppSize.height(0.01)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: AppSize.height(0.014),
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text: "Short Description: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            "Pathway Education Trust offers comprehensive admission guidance services to help individuals make informed decisions about their career paths. From exploring various options to setting goals and overcoming obstacles, we provide personalised support every step of the way.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.height(0.02)),
                const Text(
                  "Highlighted Points:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSize.height(0.01)),
                _buildBulletPoint("Exploration of Options:",
                    "Access resources and information on different career paths to make well-informed choices."),
                _buildBulletPoint("Impartial Advice:",
                    "Our career advisor consultants offer unbiased guidance to help you find the best fit for your aspirations."),
                _buildBulletPoint("Goal Setting:",
                    "Define your career goals and develop a clear plan to achieve them with our assistance."),
                _buildBulletPoint("Overcoming Obstacles:",
                    "Identify and address any obstacles standing in your way to ensure a smooth career transition."),
                _buildBulletPoint("Confidential Services:",
                    "All discussions with our counselors are kept confidential, providing a safe space to discuss your concerns and fears."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Icon(Icons.circle, size: 6, color: Colors.black54),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: AppSize.height(0.013),
                  color: Colors.black87,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: " "),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.college);
      },
      child: Container(
        width: AppSize.width(0.35),
        height: AppSize.height(0.08),
        margin: EdgeInsets.only(right: AppSize.width(0.04)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.height(0.016),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppSize.height(0.022),
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "View All",
              style: TextStyle(
                fontSize: AppSize.height(0.016),
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
