import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class CustomIconAuth extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  const CustomIconAuth({super.key, required this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: AppColor.secondaryColor.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 0, // Blur radius
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: IconButton(
            onPressed: onPressed, icon: Icon(iconData)));
  }
}
