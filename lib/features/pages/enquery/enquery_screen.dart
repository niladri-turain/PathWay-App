import 'package:flutter/material.dart';
import '../../../core/constant/app_size.dart';

class EnqueryScreen extends StatefulWidget {
  const EnqueryScreen({super.key});

  @override
  State<EnqueryScreen> createState() => _EnqueryScreenState();
}

class _EnqueryScreenState extends State<EnqueryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Enquiry Screen",
          style: TextStyle(fontSize: AppSize.height(0.03)),
        ),
      ),
    );
  }
}
