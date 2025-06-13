import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/cart_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/reciever/cartdata.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';

abstract class FoodDetailsRecieverController extends GetxController {}

class FoodDetailsRecieverControllerImp extends FoodDetailsRecieverController {
  late FoodModel foodModel;
  late StatusRequest statusRequest;
  int countitems = 0;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  initialData() async {
    statusRequest = StatusRequest.loading;
    foodModel = Get.arguments['foodmodel'];
    countitems = await getcountitems(foodModel.foodId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addfood(String foodid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPrefernces.getString("id")!, foodid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
      title: "notificationcart".tr,
      titleText: Text(
        "notificationcart".tr,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        "addcartsuccess".tr,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColor.secondaryColor, // Success color
      borderRadius: 12,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      icon: const Icon(
        Icons.shopping_cart_checkout, // Different icon for cart addition
        color: Colors.white,
        size: 28,
      ),
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

    );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletefood(String foodid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPrefernces.getString("id")!, foodid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
        title: "notificationcart".tr,
        titleText: Text(
          "notificationcart".tr,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          "deletfoodsuccess".tr,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.secondaryColor, 
        borderRadius: 12,
        margin: const EdgeInsets.all(10), 
        duration: const Duration(seconds: 3), 
        animationDuration: const Duration(milliseconds: 500), 
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 28,
        ),
        shouldIconPulse: true, 
        snackPosition: SnackPosition.TOP, 
        dismissDirection: DismissDirection.horizontal, 
      );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getcountitems(String foodid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getcountcart(
        myServices.sharedPrefernces.getString("id")!, foodid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response['data'] is int
            ? response['data']
            : int.parse(response['data'].toString());
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
        return 0;
      }
    }
    update();
  }

  add() async {
    if (countitems < foodModel.foodQuantity!.toInt()) {
      await addfood(foodModel.foodId.toString());
      countitems++;
      Get.find<CartController>().refreshpage();
      update();
    } else{
       Get.snackbar("Warning".tr, "maxquantity".tr);
    }
  }

  remove() async {
    if (countitems > 0) {
      await deletefood(foodModel.foodId.toString());
      countitems--;
      Get.find<CartController>().refreshpage();
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
