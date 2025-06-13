import 'package:flutter/material.dart';
import 'package:food_bridge/controller/theme_controller.dart';
import 'package:get/get.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color iconColor;
  final double iconSize;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 6),
    this.iconColor = Colors.black,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return InkResponse(
      radius: 20,
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Icon(
          icon,
          color: themeController.isDarkTheme ? Colors.white : Colors.black,
          size: iconSize,
        ),
      ),
    );
  }
}