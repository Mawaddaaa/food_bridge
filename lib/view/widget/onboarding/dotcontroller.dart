import 'package:flutter/material.dart';
import 'package:food_bridge/controller/onboarding_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/data/datasource/static/static.dart';
import 'package:get/get.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5,top:15),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage==index?78.51:19.31,
                          height: 7,
                          decoration: BoxDecoration(
                              color: controller.currentPage==index?AppColor.primaryColor:AppColor.grey,
                              borderRadius: BorderRadius.circular(18.12)),
                        ))
              ],
            ));
  }
}
