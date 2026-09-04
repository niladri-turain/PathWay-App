import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_pngs.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/explore_card.dart';
import '../../../widgets/item_card.dart';
import '../../../widgets/college_card.dart';
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
                            Image.asset(
                              AppImagesPng.logo,
                              height: AppSize.height(0.05),
                            ),
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
                  bottom: -AppSize.height(0.12),
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

            SizedBox(height: AppSize.height(0.03)),

            _buildHorizontalCollegeSection("Top MBA", [
              CollegeCard(
                name: "Lexicon MILE - Management...",
                location: "GAT ND 726, MILE Tower, Road...",
                imagePath: AppImagesPng.cl1,
                rating: 4.0,
                likes: 326,
                tags: const ["MBA", "PGDM"],
              ),
              CollegeCard(
                name: "Dr. D. Y. Patil Vidyapeeth, Pune",
                location: "Sant Tukaram Nagar, Pimpri Colony...",
                imagePath: AppImagesPng.cl2,
                rating: 5.0,
                likes: 189,
                tags: const ["MBA", "PGDM"],
              ),
              CollegeCard(
                name: "International School of...",
                location: "S.No 9/1/1, Wadgaon Budruk...",
                imagePath: AppImagesPng.cl3,
                rating: 4.5,
                likes: 201,
                tags: const ["MBA", "PGDM"],
              ),
              CollegeCard(
                name: "Western Business School Pune",
                location: "845, BMCC Rd, Fergusson College...",
                imagePath: AppImagesPng.one,
                rating: 4.0,
                likes: 327,
                tags: const ["MBA", "PGDM"],
              ),
            ]),

            _buildHorizontalCollegeSection("Top BBA", [
              CollegeCard(
                name: "United World School of Business...",
                location: "A/907, Uvarsad-Vavol Road, Uvarsad...",
                imagePath: AppImagesPng.karnavatiCollege,
                rating: 4.8,
                likes: 241,
                tags: const ["BBA"],
              ),
              CollegeCard(
                name: "Presidency University, Bengaluru",
                location: "Itgalpura, Yelahanka, Bangalore",
                imagePath: AppImagesPng.cl3,
                rating: 4.8,
                likes: 168,
                tags: const ["BBA", "B.TECH"],
              ),
              CollegeCard(
                name: "Karnavati University, Gujarat",
                location: "A/907, Uvarsad-Vavol Road...",
                imagePath: AppImagesPng.two,
                rating: 4.8,
                likes: 184,
                tags: const ["BBA"],
              ),
              CollegeCard(
                name: "Jain University Bengaluru",
                location: "34, 1st Cross JC Road, Bengaluru...",
                imagePath: AppImagesPng.three,
                rating: 4.0,
                likes: 348,
                tags: const ["BBA", "BCA"],
              ),
            ]),

            _buildHorizontalCollegeSection("Top MD/MS", [
              CollegeCard(
                name: "Dr. Chandramma Dayananda...",
                location: "Devarakaggalahalli, Harohalli...",
                imagePath: AppImagesPng.iqCollege,
                rating: 5.0,
                likes: 245,
                tags: const ["MD", "M.B.B.S"],
              ),
              CollegeCard(
                name: "M.S. Ramaiah Medical College...",
                location: "M S Ramaiah Nagar, Mathikere...",
                imagePath: AppImagesPng.four,
                rating: 4.0,
                likes: 341,
                tags: const ["MD", "M.B.B.S"],
              ),
              CollegeCard(
                name: "Kasturba Medical College (KMC...",
                location: "Tiger Circle Road, Madhav Nagar...",
                imagePath: AppImagesPng.five,
                rating: 5.0,
                likes: 297,
                tags: const ["MD", "M.B.B.S"],
              ),
              CollegeCard(
                name: "Jawaharlal Nehru Medical College",
                location: "JNMC Campus, Nehru Nagar...",
                imagePath: AppImagesPng.cl2,
                rating: 4.5,
                likes: 182,
                tags: const ["MD", "M.B.B.S"],
              ),
            ]),

            _buildHorizontalCollegeSection("Top M.B.B.S", [
              CollegeCard(
                name: "M.S. Ramaiah Medical College...",
                location: "M S Ramaiah Nagar, Mathikere...",
                imagePath: AppImagesPng.msCollege,
                rating: 4.0,
                likes: 341,
                tags: const ["MD", "M.B.B.S"],
              ),
              CollegeCard(
                name: "Kasturba Medical College (KMC...",
                location: "Tiger Circle Road, Madhav Nagar...",
                imagePath: AppImagesPng.ksCollege,
                rating: 5.0,
                likes: 297,
                tags: const ["MD", "M.B.B.S"],
              ),
              CollegeCard(
                name: "Dr. Chandramma Dayananda...",
                location: "Devarakaggalahalli, Harohalli...",
                imagePath: AppImagesPng.six,
                rating: 5.0,
                likes: 245,
                tags: const ["MD", "M.B.B.S"],
              ),
              CollegeCard(
                name: "Christian Medical College",
                location: "Ida Scudder Road, Vellore...",
                imagePath: AppImagesPng.cl1,
                rating: 4.9,
                likes: 512,
                tags: const ["M.B.B.S"],
              ),
            ]),

            _buildHorizontalCollegeSection("Top BDS", [
              CollegeCard(
                name: "Kusum Devi Sunderial Dugar Jai...",
                location: "6, Ram Gopal Ghosh Road, Cossipore...",
                imagePath: AppImagesPng.kusumCollege,
                rating: 4.0,
                likes: 297,
                tags: const ["BDS"],
              ),
              CollegeCard(
                name: "Haldia Institute of Dental Scienc...",
                location: "Address City Pincode...",
                imagePath: AppImagesPng.gouridebiCollege,
                rating: 5.0,
                likes: 331,
                tags: const ["BDS"],
              ),
              CollegeCard(
                name: "Bharati Vidyapeeth University...",
                location: "Bharati Vidyapeeth Educational...",
                imagePath: AppImagesPng.eight,
                rating: 4.0,
                likes: 296,
                tags: const ["BDS"],
              ),
              CollegeCard(
                name: "MGM dental college and hospita...",
                location: "Junction of NH4 and Sion-Panvel...",
                imagePath: AppImagesPng.nine,
                rating: 4.0,
                likes: 252,
                tags: const ["BDS"],
              ),
            ]),

            _buildHorizontalCollegeSection("Top B.Tech", [
              CollegeCard(
                name: "JIS College of Engineering",
                location: "Block A, Phase III, Kalyani, Nadia...",
                imagePath: AppImagesPng.sankaCollege,
                rating: 5.0,
                likes: 327,
                tags: const ["B.TECH"],
              ),
              CollegeCard(
                name: "Presidency University, Bengaluru",
                location: "Itgalpura, Yelahanka, Bangalore",
                imagePath: AppImagesPng.cl2,
                rating: 4.8,
                likes: 168,
                tags: const ["BBA", "B.TECH"],
              ),
              CollegeCard(
                name: "Dr. D. Y. Patil Vidyapeeth, Pune",
                location: "Sant Tukaram Nagar, Pimpri Colony...",
                imagePath: AppImagesPng.cl3,
                rating: 5.0,
                likes: 199,
                tags: const ["TECH", "MBA", "PGDM"],
              ),
              CollegeCard(
                name: "Christ University, Bangalore",
                location: "Dharmaram College Post, Hosur Roa...",
                imagePath: AppImagesPng.santiniketanCollege,
                rating: 4.0,
                likes: 346,
                tags: const ["BBA", "BCA", "B.TECH"],
              ),
            ]),

            SizedBox(height: AppSize.height(0.05)),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalCollegeSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
          child: Row(
            children: [
              const Icon(Icons.school, color: Colors.orange, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
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
            children: children,
          ),
        ),
        SizedBox(height: AppSize.height(0.02)),
      ],
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
