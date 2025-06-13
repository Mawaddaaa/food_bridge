import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/localization/changelocal.dart';
import 'package:food_bridge/view/widget/language/custombuttonlang.dart';
import 'package:get/get.dart';

class LanguageSettingReciever extends GetView<LocalController> {
  const LanguageSettingReciever({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                Get.offAllNamed(AppRoute.homerecieverpage);
              },
            ),
            Custombuttonlang(
              textbutton: "langButton2".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.offAllNamed(AppRoute.homerecieverpage);
              },
            )
          ],
        ),
      ),
    );
  }
}
