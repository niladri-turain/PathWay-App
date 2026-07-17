import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "About Us",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and Tagline Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: AppSize.height(0.04)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.width(0.1)),
                  bottomRight: Radius.circular(AppSize.width(0.1)),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Assuming logo exists or using placeholder
                    height: AppSize.height(0.1),
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.school,
                      size: AppSize.height(0.1),
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Text(
                    "PATHWAY",
                    style: TextStyle(
                      fontSize: AppSize.height(0.028),
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    "EDUCATION TRUST",
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.02)),
                  Text(
                    "Your Career Starts Here",
                    style: TextStyle(
                      fontSize: AppSize.height(0.018),
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
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
                  // About Description
                  Text(
                    "About Pathway Education Trust",
                    style: TextStyle(
                      fontSize: AppSize.height(0.02),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.01)),
                  Text(
                    "Pathway Education Trust is dedicated to helping students find the right courses and colleges to build a successful career.",
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.03)),

                  // Stats Grid
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(Icons.people, "Trusted by", "Thousands of\nStudents"),
                      _buildStatCard(Icons.account_balance, "200+", "Colleges\nAcross India"),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(Icons.description, "1000+", "Courses to\nChoose From"),
                      _buildStatCard(Icons.support_agent, "Expert", "Counselling\nSupport"),
                    ],
                  ),
                  SizedBox(height: AppSize.height(0.04)),

                  // FAQ Section
                  Text(
                    "Frequently Ask Questions",
                    style: TextStyle(
                      fontSize: AppSize.height(0.022),
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.02)),
                  _buildFaqItem(
                    "What services does Pathway Education Trust offer?",
                    answer: "We offer comprehensive career counseling, college selection assistance, admission guidance, and scholarship support to help students achieve their academic goals.",
                  ),
                  _buildFaqItem(
                    "Does Pathway Education Trust assist with scholarship applications?",
                    answer: "Yes, we provide detailed information about available scholarships and help students throughout the application process to increase their chances of success.",
                  ),
                  _buildFaqItem(
                    "Who can benefit from Pathway Education Trust's services?",
                    answer: "Any student looking for higher education opportunities, career clarity, or admission assistance in top colleges across India can benefit from our expert services.",
                  ),
                  _buildFaqItem(
                    "Is Pathway Education Trust's 24/7 support available for all students?",
                    answer: "Yes, our dedicated support team is available round the clock to answer your queries and provide the necessary guidance whenever you need it.",
                  ),
                  _buildFaqItem(
                    "How does Pathway Education Trust provide personalized support?",
                    answer: "We assign dedicated counselors to each student who provide one-on-one sessions to understand their interests and recommend the best possible career paths.",
                  ),
                  _buildFaqItem(
                    "Can Pathway Education Trust help with education loans?",
                    answer: "Yes, Pathway Education Trust provides information and assistance regarding education loans, including guidance on loan options, eligibility criteria, and application procedures.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label) {
    return Container(
      width: AppSize.width(0.43),
      padding: EdgeInsets.all(AppSize.width(0.03)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.width(0.03)),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.green, size: AppSize.height(0.035)),
          SizedBox(height: AppSize.height(0.01)),
          Text(
            value,
            style: TextStyle(
              fontSize: AppSize.height(0.018),
              fontWeight: FontWeight.bold,
              color: AppColors.green,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppSize.height(0.014),
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, {String? answer}) {
    return FaqItem(question: question, answer: answer);
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String? answer;

  const FaqItem({super.key, required this.question, this.answer});

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.height(0.015)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.width(0.02)),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(AppSize.width(0.02)),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(0.04),
                vertical: AppSize.height(0.015),
              ),
              decoration: BoxDecoration(
                color: isExpanded ? AppColors.green : AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.width(0.02)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: TextStyle(
                        fontSize: AppSize.height(0.016),
                        fontWeight: FontWeight.w500,
                        color: isExpanded ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: isExpanded ? AppColors.white : AppColors.black,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded && widget.answer != null)
            Padding(
              padding: EdgeInsets.all(AppSize.width(0.04)),
              child: Text(
                widget.answer!,
                style: TextStyle(
                  fontSize: AppSize.height(0.015),
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
