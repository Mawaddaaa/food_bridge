import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class Custombuttonlang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const Custombuttonlang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        height: 43,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          textbutton,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
