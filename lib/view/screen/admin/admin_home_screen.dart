import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/admin_home_screen_controller.dart';
import 'package:food_bridge/view/widget/admin/custom_action_buttons.dart';
import 'package:food_bridge/view/widget/admin/custom_admin_drawer.dart';
import 'package:food_bridge/view/widget/admin/custom_button_navbar.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_image_asset.dart';
import '../../../core/constant/color.dart';
import '../../widget/donor/custom_donor_drawer.dart';

class AdminHomeScreen extends StatelessWidget {
   AdminHomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeScreenControllerImp());
    return GetBuilder<AdminHomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F2F3),
          title: const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                backgroundImage: AssetImage(AppImageAsset.logo2),
              ),
              SizedBox(
                width: 5,
              ),

              Text(
                "Food Bridge",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
            ],
          ),
          actions:  [
            CustomactionbuttonsAdmin(scaffoldKey: scaffoldKey ,)
          ],
        ),
        endDrawer: const AdminDrawer(),
        bottomNavigationBar: const CustomBottomNavBarAdmin(),
        body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                title: "ExitAlertTitle".tr,
                titleStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColor.primaryColor,
                ),
                middleText: "ExitAlertQuestion".tr,
                backgroundColor: Colors.white,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                    ),
                    child: Text(
                      "ExitAlertButton1".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text(
                      "ExitAlertButton2".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
              return Future.value(false);
            },
            child: controller.listPage.elementAt(controller.currentPage)),
      ),
    );
  }
}