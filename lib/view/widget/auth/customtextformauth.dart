import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labeltext;
  final TextEditingController mycontroller;
  final TextInputType type;
  final bool isPassword = false;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final IconData? iconData;
  final String? Function(String?) valid;
  final bool isClickable = true;
  final Color borderColor = AppColor.primaryColor;
  final Color labeledColor = Colors.grey;
  final TextStyle? textStyle;

  const CustomTextFormAuth({
    super.key,
    required this.labeltext,
    required this.type,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.obscureText,
    this.onTapIcon,
    this.iconData,
    required this.mycontroller,
    this.textStyle,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      keyboardType: type,
      onFieldSubmitted: onSubmit, 
      onChanged: onChanged,
      onTap: onTap,
      enabled: isClickable,
      obscureText: obscureText == null || obscureText == false ? false : true,
      validator: valid,
      style: textStyle,
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: TextStyle(color: labeledColor),
        filled: true,
        fillColor: const Color(0xFFFFFBFB),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor),
        ),
        suffixIcon: InkWell(
          onTap: onTapIcon,
          child: Icon(iconData),
        ),
      ),
    );
  }
}