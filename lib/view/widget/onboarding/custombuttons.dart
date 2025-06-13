import 'package:flutter/material.dart';
import 'package:food_bridge/controller/onboarding_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/data/datasource/static/static.dart';
import 'package:food_bridge/view/widget/onboarding/custombutton.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Center( 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                if (controller.currentPage == 0)
                  Column(
                    children: [
                      Custombutton(
                        text: "button1".tr,
                        backgroundColor: AppColor.primaryColor,
                        textColor: Colors.white,
                        width: 248,
                        onPressed: () {
                          controller.next();
                        },
                      ),
                      const SizedBox(height: 10), 
                      Custombutton(
                        text: "skipText".tr,
                        backgroundColor: Colors.white,
                        textColor: AppColor.primaryColor,
                        isTextButton: true,
                        onPressed: () {
                          controller.finish();
                        },
                      ),
                    ],
                  )
                else if (controller.currentPage == onBoardingList.length - 1)
                  Custombutton(
                    text: "button3".tr,
                    backgroundColor: AppColor.primaryColor,
                    textColor: Colors.white,
                    width: 248,
                    onPressed: () {
                      controller.finish();
                    },
                  )
                else ...[
                    Custombutton(
                      text: "button2".tr,
                      backgroundColor: AppColor.primaryColor,
                      textColor: Colors.white,
                      width: 248,
                      onPressed: () {
                        controller.next();
                      },
                    ),
                    const SizedBox(height: 10), 
                    Custombutton(
                      text: "skipText".tr,
                      backgroundColor: Colors.white,
                      textColor: AppColor.primaryColor,
                      isTextButton: true,
                      onPressed: () {
                        controller.finish();
                      },
                    ),
                  ],
              ],
            ),
          ),
        );
      },
    );
  }
}
