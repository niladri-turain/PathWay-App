import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';

class MyEnquiriesScreen extends StatelessWidget {
  const MyEnquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> enquiries = [
      {
        "id": "ENQ12345",
        "course": "MBA in Finance",
        "college": "Amity University, Delhi",
        "status": "Answered",
        "date": "12 Apr 2026"
      },
      {
        "id": "ENQ12344",
        "course": "BCA Admission",
        "college": "LPU, Punjab",
        "status": "Pending",
        "date": "10 Apr 2026"
      },
      {
        "id": "ENQ12343",
        "course": "MCA Details",
        "college": "Manipal University, Jaipur",
        "status": "Answered",
        "date": "08 Apr 2026"
      },
      {
        "id": "ENQ12342",
        "course": "BBA Admission",
        "college": "Chandigarh University",
        "status": "Pending",
        "date": "05 Apr 2026"
      },
      {
        "id": "ENQ12341",
        "course": "MBBS Enquiry",
        "college": "KMC, Manipal",
        "status": "Answered",
        "date": "01 Apr 2026"
      },
      {
        "id": "ENQ12340",
        "course": "B.Tech CS",
        "college": "VIT, Vellore",
        "status": "Answered",
        "date": "28 Mar 2026"
      },
      {
        "id": "ENQ12339",
        "course": "M.Tech Data Science",
        "college": "SRM, Chennai",
        "status": "Pending",
        "date": "25 Mar 2026"
      },
      {
        "id": "ENQ12338",
        "course": "Law Admission",
        "college": "Symbiosis, Pune",
        "status": "Answered",
        "date": "20 Mar 2026"
      },
      {
        "id": "ENQ12337",
        "course": "Hotel Management",
        "college": "IHM, Pusa",
        "status": "Pending",
        "date": "15 Mar 2026"
      },
      {
        "id": "ENQ12336",
        "course": "Pharmacy Admission",
        "college": "Jamia Hamdard",
        "status": "Answered",
        "date": "10 Mar 2026"
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
          "My Enquiries",
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
        itemCount: enquiries.length,
        itemBuilder: (context, index) {
          final item = enquiries[index];
          return _buildEnquiryCard(item);
        },
      ),
    );
  }

  Widget _buildEnquiryCard(Map<String, String> enquiry) {
    bool isAnswered = enquiry['status'] == "Answered";

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
                "Enquiry ID: ${enquiry['id']}",
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
                  color: isAnswered
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSize.width(0.05)),
                  border: Border.all(
                    color: isAnswered
                        ? Colors.green.withOpacity(0.2)
                        : Colors.orange.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  enquiry['status']!,
                  style: TextStyle(
                    fontSize: AppSize.height(0.014),
                    color: isAnswered ? Colors.green[700] : Colors.orange[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.height(0.01)),
          Text(
            enquiry['course']!,
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
              Text(
                enquiry['college']!,
                style: TextStyle(
                  fontSize: AppSize.height(0.016),
                  color: Colors.grey[700],
                ),
              ),
              Text(
                enquiry['date']!,
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
