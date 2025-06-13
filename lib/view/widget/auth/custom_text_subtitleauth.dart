import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class CustomTextSubtitleauth extends StatelessWidget {
  final String text;
  const CustomTextSubtitleauth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
