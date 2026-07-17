import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';

class AppliedCollegesScreen extends StatelessWidget {
  const AppliedCollegesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appliedColleges = [
      {
        "college": "Amity University",
        "location": "Noida, Uttar Pradesh",
        "status": "Shortlisted",
        "date": "12 Apr 2024",
        "id": "APP98765"
      },
      {
        "college": "Lovely Professional University",
        "location": "Phagwara, Punjab",
        "status": "Applied",
        "date": "10 Apr 2024",
        "id": "APP98764"
      },
      {
        "college": "Manipal Academy of Higher Education",
        "location": "Manipal, Karnataka",
        "status": "Under Review",
        "date": "08 Apr 2024",
        "id": "APP98763"
      },
      {
        "college": "Chandigarh University",
        "location": "Mohali, Punjab",
        "status": "Shortlisted",
        "date": "05 Apr 2024",
        "id": "APP98762"
      },
      {
        "college": "Vellore Institute of Technology",
        "location": "Vellore, Tamil Nadu",
        "status": "Applied",
        "date": "01 Apr 2024",
        "id": "APP98761"
      },
      {
        "college": "SRM Institute of Science and Tech",
        "location": "Chennai, Tamil Nadu",
        "status": "Rejected",
        "date": "28 Mar 2024",
        "id": "APP98760"
      },
      {
        "college": "Symbiosis International University",
        "location": "Pune, Maharashtra",
        "status": "Shortlisted",
        "date": "25 Mar 2024",
        "id": "APP98759"
      },
      {
        "college": "Bennett University",
        "location": "Greater Noida, UP",
        "status": "Applied",
        "date": "20 Mar 2024",
        "id": "APP98758"
      },
      {
        "college": "Kalinga Institute of Industrial Tech",
        "location": "Bhubaneswar, Odisha",
        "status": "Under Review",
        "date": "15 Mar 2024",
        "id": "APP98757"
      },
      {
        "college": "Christ University",
        "location": "Bangalore, Karnataka",
        "status": "Shortlisted",
        "date": "10 Mar 2024",
        "id": "APP98756"
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
          "Applied Colleges",
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
        itemCount: appliedColleges.length,
        itemBuilder: (context, index) {
          final item = appliedColleges[index];
          return _buildCollegeCard(item);
        },
      ),
    );
  }

  Widget _buildCollegeCard(Map<String, String> data) {
    Color statusColor;
    switch (data['status']) {
      case "Shortlisted":
        statusColor = Colors.green;
        break;
      case "Rejected":
        statusColor = Colors.red;
        break;
      case "Under Review":
        statusColor = Colors.blue;
        break;
      default:
        statusColor = Colors.orange;
    }

    return Container(
      margin: EdgeInsets.only(bottom: AppSize.height(0.02)),
      padding: EdgeInsets.all(AppSize.width(0.04)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.width(0.03)),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Application ID: ${data['id']}",
                style: TextStyle(
                  fontSize: AppSize.height(0.016),
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(0.03),
                  vertical: AppSize.height(0.005),
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSize.width(0.05)),
                  border: Border.all(color: statusColor.withOpacity(0.2)),
                ),
                child: Text(
                  data['status']!,
                  style: TextStyle(
                    fontSize: AppSize.height(0.014),
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.height(0.01)),
          Text(
            data['college']!,
            style: TextStyle(
              fontSize: AppSize.height(0.02),
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: AppSize.height(0.005)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  data['location']!,
                  style: TextStyle(
                    fontSize: AppSize.height(0.016),
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Text(
                data['date']!,
                style: TextStyle(
                  fontSize: AppSize.height(0.016),
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
