import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_navigation.dart';

class EnqueryScreen extends StatefulWidget {
  final String? courseName;
  const EnqueryScreen({super.key, this.courseName});

  @override
  State<EnqueryScreen> createState() => _EnqueryScreenState();
}

class _EnqueryScreenState extends State<EnqueryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? _selectedCourse;

  final List<String> _courses = [
    "MBA",
    "BBA",
    "BCA",
    "B.Tech",
    "MBBS",
    "MD/MS",
  ];

  @override
  void initState() {
    super.initState();
    if (widget.courseName != null) {
      _selectedCourse = widget.courseName;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
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
          "Enquiry Form",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.05)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Have questions? Reach out to us!",
                style: TextStyle(
                  fontSize: AppSize.height(0.02),
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: AppSize.height(0.03)),
              
              _buildLabel("Full Name"),
              _buildTextField(_nameController, "Enter your full name", Icons.person_outline),
              
              _buildLabel("Email Address"),
              _buildTextField(_emailController, "Enter your email", Icons.email_outlined, keyboardType: TextInputType.emailAddress),
              
              _buildLabel("Phone Number"),
              _buildTextField(_phoneController, "Enter your phone number", Icons.phone_android_outlined, keyboardType: TextInputType.phone),
              
              _buildLabel("Interested Course"),
              _buildDropdown(),
              
              _buildLabel("Message"),
              _buildTextField(_messageController, "Tell us what you're looking for...", Icons.message_outlined, maxLines: 4),
              
              SizedBox(height: AppSize.height(0.04)),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showSuccessDialog();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  minimumSize: Size(double.infinity, AppSize.height(0.06)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  "Submit Enquiry",
                  style: TextStyle(
                    fontSize: AppSize.height(0.02),
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: AppSize.height(0.02)),
              Center(
                child: Text(
                  "We'll get back to you within 24 hours.",
                  style: TextStyle(
                    fontSize: AppSize.height(0.014),
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.height(0.01), top: AppSize.height(0.01)),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppSize.height(0.016),
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(fontSize: AppSize.height(0.018)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: AppSize.height(0.016)),
        prefixIcon: Icon(icon, color: AppColors.green, size: AppSize.height(0.022)),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.width(0.02)),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.width(0.02)),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.width(0.02)),
          borderSide: const BorderSide(color: AppColors.green),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSize.height(0.015),
          horizontal: AppSize.width(0.04),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCourse,
      dropdownColor: AppColors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.school_outlined, color: AppColors.green, size: AppSize.height(0.022)),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.width(0.02)),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.width(0.02)),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.width(0.02)),
          borderSide: const BorderSide(color: AppColors.green),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSize.height(0.015),
          horizontal: AppSize.width(0.04),
        ),
      ),
      hint: Text("Select Course", style: TextStyle(color: Colors.grey[400], fontSize: AppSize.height(0.016))),
      items: _courses.map((String course) {
        return DropdownMenuItem<String>(
          value: course,
          child: Text(course, style: TextStyle(fontSize: AppSize.height(0.018))),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedCourse = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a course';
        }
        return null;
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.width(0.04))),
        title: const Icon(Icons.check_circle, color: AppColors.green, size: 60),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enquiry Submitted!",
              style: TextStyle(
                fontSize: AppSize.height(0.022),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.height(0.01)),
            Text(
              "Our team will contact you shortly to help you with the admission process.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.height(0.016),
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: const Text("OK", style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
