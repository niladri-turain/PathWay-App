import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_size.dart';

class PartnerCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const PartnerCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.width(0.35),
        height: AppSize.height(0.16), // নির্দিষ্ট উচ্চতা নিশ্চিত করা হলো
        margin: EdgeInsets.only(right: AppSize.width(0.04)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // এটি কলামকে তার কন্টেন্ট অনুযায়ী সাইজ নিতে সাহায্য করবে
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.height(0.013),
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
