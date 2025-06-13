import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPrefernces.getString("step") == "2") {
      return  const RouteSettings(name: AppRoute.homedonorpage);
    }
    if (myServices.sharedPrefernces.getString("step") == "3") {
      return  const RouteSettings(name: AppRoute.homerecieverpage);
    }
    if (myServices.sharedPrefernces.getString("step") == "4") {
      return  const RouteSettings(name: AppRoute.adminhome);
    }
    if (myServices.sharedPrefernces.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
