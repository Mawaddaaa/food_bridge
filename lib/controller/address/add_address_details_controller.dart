import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/address/address_data.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  String? lat;
  String? long;

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPrefernces.getString("id")!,
        name.text,
        city.text,
        street.text,
        lat!,
        long!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homedonorpage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
