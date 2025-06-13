import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:food_bridge/core/constant/color.dart';

Widget buildOtpTextField({required Function(String) onSubmit}) {
  return OtpTextField(
    numberOfFields: 6,
    borderColor: Colors.grey,
    focusedBorderColor: AppColor.primaryColor,
    showFieldAsBox: true,
    fieldWidth: 35,
    fieldHeight: 50,
    borderRadius: BorderRadius.circular(10),
    keyboardType: TextInputType.number,
    onCodeChanged: (String code) {
      // Optional: Handle input change
    },
    onSubmit: (String code) {
      onSubmit(code);
    },
  );
}

