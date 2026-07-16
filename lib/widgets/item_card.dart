import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_size.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double? rating;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.width(0.42),
        margin: EdgeInsets.only(right: AppSize.width(0.04)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.width(0.03)),
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
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSize.width(0.03))),
              child: Image.asset(
                imagePath,
                height: AppSize.height(0.12),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSize.width(0.025)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppSize.height(0.016),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.005)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: AppSize.height(0.014),
                          color: Colors.grey[600],
                        ),
                      ),
                      if (rating != null)
                        Row(
                          children: [
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                fontSize: AppSize.height(0.014),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: AppSize.height(0.015),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
