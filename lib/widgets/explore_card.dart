import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_size.dart';

class ExploreCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ExploreCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(0.2),
      padding: EdgeInsets.symmetric(vertical: AppSize.height(0.015)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.width(0.02)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.green,
            size: AppSize.height(0.04),
          ),
          SizedBox(height: AppSize.height(0.005)),
          Text(
            label,
            style: TextStyle(
              fontSize: AppSize.height(0.015),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
