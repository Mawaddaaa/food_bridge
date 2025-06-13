import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
  finish();
}

class OnBoardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  finish() {
    myServices.sharedPrefernces.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
