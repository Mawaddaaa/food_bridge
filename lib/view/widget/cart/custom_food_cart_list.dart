import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/linkapi.dart';

class CustomFoodCartList extends StatelessWidget {
  final String name;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomFoodCartList({
    super.key,
    required this.name,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: "${AppLink.image}/$imagename",
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),

            // Name
            Expanded(
              flex: 2,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Row for Add - Count - Remove
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add button
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add, size: 18, color: Colors.white),
                      onPressed: onAdd,
                    ),
                  ),
                  const SizedBox(width:12),

                  // Count text
                  Text(
                    count,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Remove button
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.remove, size: 18, color: Colors.white),
                      onPressed: onRemove,
                    ),
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
