import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/cart_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/reciever/cartdata.dart';
import 'package:food_bridge/data/datasource/remote/reciever/home_reciever_data.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

import '../food/filter.dart';

abstract class HomeRecieverController extends GetxController {
  initialData();
  getdata();
  goToPageFoodDetails(FoodModel foodModel);
  Future<void> applyFilters();
  resetFilters();
  Future<bool> canAddFood(String foodId, int maxQuantity);
  addfood(String foodid, int maxQuantity);
  Future<Position?> getCurrentUserLocation();
}

class HomeRecieverControllerImp extends HomeRecieverController {
  MyServices myServices = Get.find();
  FilterFoodController filterController = Get.find();

  String? username;
  String? id;
  late FoodModel foodModel;
  Position? currentUserPosition;

  HomeRecieverData homeRecieverData = HomeRecieverData(Get.find());
  CartController cartController = Get.put(CartController());

  var food = <dynamic>[].obs;
  var filteredFood = <dynamic>[].obs;
  var filtersApplied = false.obs;
  int countitems = 0;

  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000; 
  }

  @override
  initialData() {
    username = myServices.sharedPrefernces.getString("username");
    id = myServices.sharedPrefernces.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeRecieverData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'] != null) {
          food.value = response['data'];
          filteredFood.value = List.from(response['data']);
          filtersApplied.value = false;
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future<Position?> getCurrentUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Warning".tr, "Locationdisabled".tr);
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Warning".tr, "Locationpermissionsdenied".tr);
          return null;
        }
      }

      currentUserPosition = await Geolocator.getCurrentPosition();
      return currentUserPosition;
    } catch (e) {
      Get.snackbar("Error".tr, "${"Failedgetlocation".tr}: ${e.toString()}");
      return null;
    }
  }

  @override
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

  @override
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
    cartController.refreshpage();
    update();
  }

  @override
  goToPageFoodDetails(foodModel) {
    Get.toNamed(AppRoute.foodDetailsReciever,
        arguments: {"foodmodel": foodModel});
  }

  @override
  Future<void> applyFilters() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      List<dynamic> currentList = filtersApplied.value ? filteredFood.value : food.value;
      List<dynamic> result = List.from(currentList);

      if (filterController.typeController.text.isNotEmpty) {
        result = result.where((item) => (item['food_type'] as String?)
            ?.toLowerCase()
            .contains(filterController.typeController.text.toLowerCase()) ?? false)
            .toList();
      }

      if (filterController.selectedQuantity.value != null) {
        int quantity = int.parse(filterController.selectedQuantity.value!);
        result = result.where((item) => item['food_quantity'] == quantity).toList();
      }

      if (filterController.selectedExpiration.value != null) {
        final now = DateTime.now();
        final dateFormat = DateFormat('yyyy-MM-dd');

        result = result.where((item) {
          if (item['food_expiredate'] == null) return false;
          final expiryDate = dateFormat.parse(item['food_expiredate']);
          final difference = expiryDate.difference(now).inDays;

          switch (filterController.selectedExpiration.value) {
            case 'Within a day':
              return difference >= 0 && difference <= 1;
            case 'Within a week':
              return difference >= 0 && difference <= 7;
            case 'Within a month':
              return difference >= 0 && difference <= 30;
            default:
              return true;
          }
        }).toList();
      }

      if (filterController.isDistanceFilterEnabled.value) {
        if (currentUserPosition == null) {
          await getCurrentUserLocation();
        }

        if (currentUserPosition != null) {
          final maxDistance = filterController.distance.value;

          result = result.where((item) {
            if (item['address_lat'] == null || item['address_long'] == null) return false;

            final distance = _calculateDistance(
              currentUserPosition!.latitude,
              currentUserPosition!.longitude,
              item['address_lat'],
              item['address_long'],
            );

            item['distance'] = distance;

            return distance <= maxDistance;
          }).toList();
        }
      }

      if (filterController.sortBy.value == 'newest') {
        result.sort((a, b) {
          final dateA = DateTime.parse(a['food_datetime']);
          final dateB = DateTime.parse(b['food_datetime']);
          return dateB.compareTo(dateA);
        });
      }
      else if (filterController.sortBy.value == 'closest' && currentUserPosition != null) {
        result.sort((a, b) {
          final distanceA = a['distance'] ?? _calculateDistance(
            currentUserPosition!.latitude,
            currentUserPosition!.longitude,
            a['address_lat'],
            a['address_long'],
          );

          final distanceB = b['distance'] ?? _calculateDistance(
            currentUserPosition!.latitude,
            currentUserPosition!.longitude,
            b['address_lat'],
            b['address_long'],
          );

          return distanceA.compareTo(distanceB);
        });
      }

      filteredFood.value = result;
      filtersApplied.value = true;
      statusRequest = StatusRequest.success;
    } catch (e) {
      filteredFood.value = List.from(food.value);
      filtersApplied.value = false;
      statusRequest = StatusRequest.failure;
      Get.snackbar("Error".tr, "${"Failedapplyfilters".tr}: ${e.toString()}");
    }

    update();
  }

  @override
  void resetFilters() {
    filterController.clearAllFilters();
    filteredFood.value = List.from(food.value);
    filtersApplied.value = false;
    update();
  }
}