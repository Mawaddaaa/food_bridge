import 'package:flutter/material.dart';
import 'package:food_bridge/controller/onboarding_controller.dart';
import 'package:food_bridge/view/widget/onboarding/custombuttons.dart';
import 'package:food_bridge/view/widget/onboarding/customslider.dart';
import 'package:food_bridge/view/widget/onboarding/dotcontroller.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnboarding(),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDotControllerOnboarding(),
                       SizedBox(height: 20),
                       CustomButtonOnBoarding(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
