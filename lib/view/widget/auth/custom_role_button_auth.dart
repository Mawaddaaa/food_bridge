import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class CustomRoleButtonAuth extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomRoleButtonAuth({super.key, required this.title, required this.onPressed, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap:onPressed,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primaryColor : Colors.transparent,
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}