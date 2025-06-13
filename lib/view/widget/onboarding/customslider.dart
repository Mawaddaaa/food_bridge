import 'package:flutter/material.dart';
import 'package:food_bridge/controller/onboarding_controller.dart';
import 'package:food_bridge/data/datasource/static/static.dart';
import 'package:get/get.dart';

class CustomSliderOnboarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.asset(
            onBoardingList[i].image!,
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 70), 
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style:const TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.w400)
            ),
          ),
        ],
      ),
    );
  }
}
