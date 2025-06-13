import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  const CustomButtonAppBar(
      {super.key,
      required this.text,
      required this.icon,
      this.onPressed,
      required this.active});

  final void Function()? onPressed;
  final String text;
  final IconData icon;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkResponse(
        radius: 20,
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color:
                  active == true ? AppColor.primaryColor : AppColor.darkGray,
            ),
            Text(text,
                style: TextStyle(
                  fontSize: 13,
                  color: active == true
                      ? AppColor.primaryColor
                      : Colors.grey.shade600,
                )),
          ],
        ),
      ),
    );
  }
}
