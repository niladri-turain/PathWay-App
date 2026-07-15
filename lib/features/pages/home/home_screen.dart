import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/explore_card.dart';
import '../../../widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                  bottom: -AppSize.height(0.13),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExploreCard(icon: Icons.menu_book, label: "Courses"),
                      ExploreCard(icon: Icons.account_balance, label: "Colleges"),
                      ExploreCard(icon: Icons.edit_document, label: "Enquiry"),
                      ExploreCard(icon: Icons.phone_android, label: "Contact"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.height(0.03)),

            // Popular Courses
            _buildHeader("Popular Courses"),
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

            // Top Colleges
            _buildHeader("Top Colleges"),
            SizedBox(height: AppSize.height(0.015)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: AppSize.width(0.05), bottom: 10),
              child: const Row(
                children: [
                  ItemCard(
                    title: "Amity University",
                    subtitle: "4.5",
                    imagePath: AppImagesPng.cl1,
                    rating: 4.5,
                  ),
                  ItemCard(
                    title: "LPU Punjab",
                    subtitle: "4.2",
                    imagePath: AppImagesPng.cl2,
                    rating: 4.2,
                  ),
                  ItemCard(
                    title: "Manipal University",
                    subtitle: "4.7",
                    imagePath: AppImagesPng.cl3,
                    rating: 4.7,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.height(0.05)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
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
          Text(
            "View All",
            style: TextStyle(
              fontSize: AppSize.height(0.016),
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
