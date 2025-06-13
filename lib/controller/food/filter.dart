import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:food_bridge/data/datasource/remote/food/filter.dart';
import 'package:latlong2/latlong.dart';

class FilterFoodController extends GetxController {
  final FilterFoodData filterFoodData = FilterFoodData(Get.find());

  // Controllers
  final TextEditingController typeController = TextEditingController();

  // Options
  final quantities = ['1', '2', '3', '4', '5', '6'].obs;
  final expirationOptions = ['Withinaday'.tr, 'Withinaweek'.tr, 'Withinamonth'.tr].obs;

  // Filter values
  var selectedQuantity = Rx<String?>(null);
  var selectedExpiration = Rx<String?>(null);
  var distance = 1.0.obs;
  var sortBy = 'newest'.obs;

  var isDistanceFilterEnabled = false.obs;
  var currentLocation = Rxn<LatLng>();

  // Clear all filters
  void clearAllFilters() {
    typeController.clear();
    selectedQuantity.value = null;
    selectedExpiration.value = null;
    distance.value = 1.0;
    sortBy.value = 'newest';
    update();
  }

  // Update methods
  void updateFoodType(String value) {
    // Handle food type update if needed
    update();
  }

  void clearFoodType() {
    typeController.clear();
    update();
  }

  void updateQuantity(String value) {
    selectedQuantity.value = value;
    update();
  }

  void updateExpiration(String value) {
    selectedExpiration.value = value;
    update();
  }

  void updateDistance(double value) {
    distance.value = value;
    update();
  }

  void updateSortBy(String? value) {
    if (value != null) {
      sortBy.value = value;
      update();
    }
  }

  Future<Map<String, dynamic>> getFilterParams() async {
    return {
      "food_type": typeController.text.isNotEmpty ? typeController.text : null,
      "quantity": selectedQuantity.value != null ? int.tryParse(selectedQuantity.value!) : null,
      "expiration": selectedExpiration.value,
      "sort": sortBy.value,
      "max_distance": isDistanceFilterEnabled.value ? distance.value : null,
      "current_lat": currentLocation.value?.latitude,
      "current_lng": currentLocation.value?.longitude,
    };
  }

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      Position position = await Geolocator.getCurrentPosition();
      currentLocation.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print("Error getting location: $e");
    }
  }


}