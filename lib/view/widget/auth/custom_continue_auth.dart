import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';

class CustomContinueAuth extends StatelessWidget {
  const CustomContinueAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "continueWithText".tr,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor),
      textAlign: TextAlign.center,
    );
  }
}
