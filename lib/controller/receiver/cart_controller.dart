import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/reciever/cartdata.dart';
import 'package:food_bridge/data/model/cartmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  int totalcount = 0;

  addfood(String foodid, int maxQuantity) async {
  bool canAdd = await canAddFood(foodid, maxQuantity);
  if (!canAdd) {
    Get.snackbar("Warning".tr, "maxquantity".tr);
    return;
  }

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
  Get.find<CartController>().refreshpage();
  update();
}

  Future<bool> canAddFood(String foodId, int maxQuantity) async {
  var response = await cartData.getcountcart(
      myServices.sharedPrefernces.getString("id")!, foodId);
  if (handlingData(response) == StatusRequest.success) {
    if (response['status'] == "success") {
      int currentCount = response['data'] is int
          ? response['data']
          : int.parse(response['data'].toString());
      return currentCount < maxQuantity;
    }
  }
  return false;
}

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.view(myServices.sharedPrefernces.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataresponse = response['datacart'];
        Map dataresponsecount = response['count'];
        data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        totalcount = dataresponsecount['totalcount'] is int
            ? dataresponsecount['totalcount']
            : int.parse(dataresponsecount['totalcount']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String foodid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPrefernces.getString("id")!, foodid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        await view();
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

  resetVarCart() {
    totalcount = 0;
    data.clear();
  }

  refreshpage() {
    resetVarCart();
    view();
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
      }
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
