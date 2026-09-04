import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_size.dart';

class CollegeCard extends StatelessWidget {
  final String name;
  final String location;
  final String imagePath;
  final double rating;
  final int likes;
  final List<String> tags;
  final VoidCallback? onTap;

  const CollegeCard({
    super.key,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.likes,
    required this.tags,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.width(0.48),
        margin: EdgeInsets.only(right: AppSize.width(0.04)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    height: AppSize.height(0.12),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: tags.map((tag) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: AppSize.height(0.01),
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppSize.height(0.014),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 10, color: Colors.grey),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppSize.height(0.01),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: AppSize.height(0.012)),
                          const SizedBox(width: 2),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: AppSize.height(0.012),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: AppSize.height(0.012)),
                          const SizedBox(width: 2),
                          Text(
                            likes.toString(),
                            style: TextStyle(
                              fontSize: AppSize.height(0.012),
                              color: Colors.black,
                            ),
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
