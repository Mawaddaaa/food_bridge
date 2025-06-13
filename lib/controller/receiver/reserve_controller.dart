import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/reciever/reserve_data.dart';
import 'package:get/get.dart';

class ReserveController extends GetxController {
  ReserveData reserveData = ReserveData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  reserve() async {
    statusRequest = StatusRequest.loading;
    update();
    Map data = {"usersid": myServices.sharedPrefernces.getString("id")};
    var response = await reserveData.reserve(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homerecieverpage);
       Get.snackbar(
      "success".tr,
      "reservationdonesuccessfully".tr,
      colorText: Colors.white,
      backgroundColor: AppColor.secondaryColor,
      borderRadius: 12,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 400),
      icon: const Icon(Icons.check_circle, color: Colors.white, size: 28),
      shouldIconPulse: true,
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.horizontal,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 2,
        )
      ],
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: Text(
          "ok".tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      titleText: Text(
        "success".tr,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  messageText: Text(
    "reservationdonesuccessfully".tr,
    style: const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  ),  
);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error".tr, "TryAgain".tr);
      }
    }
    update();
  }

}
