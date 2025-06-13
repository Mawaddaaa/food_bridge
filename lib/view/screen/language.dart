import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/localization/changelocal.dart';
import 'package:food_bridge/view/widget/language/custombuttonlang.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "text".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Custombuttonlang(
              textbutton: "langButton1".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Custombuttonlang(
              textbutton: "langButton2".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(AppRoute.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
