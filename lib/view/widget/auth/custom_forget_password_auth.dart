import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';

class CustomForgetPasswordAuth extends StatelessWidget {
  final void Function()? onPressed;
  const CustomForgetPasswordAuth({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "ForgotPasswordText".tr,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
