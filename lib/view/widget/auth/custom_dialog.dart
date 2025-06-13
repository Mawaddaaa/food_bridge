import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';


void showCustomDialog({required String title, required String middleText}) {
  TextStyle? titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
  );

  Get.defaultDialog(
    title: title,
    titleStyle: titleStyle,
    middleText: middleText,
    middleTextStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    contentPadding: const EdgeInsets.all(5),
  );
}