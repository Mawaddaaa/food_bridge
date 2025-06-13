import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/donor/donor_home_screen_controller.dart';
import '../../../core/constant/app_image_asset.dart';
import '../../../core/constant/color.dart';
import '../../widget/donor/custom_action_buttons.dart';
import '../../widget/donor/custom_bottom_navbar.dart';
import '../../widget/donor/custom_donor_drawer.dart';

class DonorHomescreen extends StatelessWidget {
   DonorHomescreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(DonorHomeScreenControllerImp());
    return GetBuilder<DonorHomeScreenControllerImp>(
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
            Customactionbuttons(scaffoldKey: scaffoldKey ,)
          ],
        ),
        endDrawer: const DonnorDrawer(),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              controller.goadditemscreen();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavBar(),
        body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                  title: "Warning".tr,
                  titleStyle: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.primaryColor),
                  middleText: "ExitAlertQuestion".tr,
                  onCancel: () {},
                  cancelTextColor: AppColor.secondaryColor,
                  confirmTextColor: AppColor.secondaryColor,
                  buttonColor:AppColor.darkGray,
                  onConfirm: () {
                    exit(0);
                  });
              return Future.value(false);
            },
            child: controller.listPage.elementAt(controller.currentPage)),
      ),
    );
  }
}