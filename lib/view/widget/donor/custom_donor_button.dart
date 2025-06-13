import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class CustomDonorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String id;
  const CustomDonorButton( 
      {super.key, required this.onPressed, required this.text, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 35,
      child: FloatingActionButton(
        heroTag: "customButton_${text}_$id",
        onPressed:onPressed,
        backgroundColor: AppColor.primaryColor,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
