import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "ExitAlertTitle".tr,
      titleStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      middleText: "ExitAlertQuestion".tr,
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
            child: Text(
              "ExitAlertButton1".tr,
              style: const TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child: Text(
                "ExitAlertButton2".tr,
              style: const TextStyle(color: Colors.white),
            )),
      ]);
  return Future.value(true);
}
