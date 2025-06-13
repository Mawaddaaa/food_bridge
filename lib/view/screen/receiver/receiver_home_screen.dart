import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/food/filter.dart';
import '../../../controller/receiver/receiver_home_screen_controller.dart';
import '../../../core/constant/app_image_asset.dart';
import '../../../core/constant/color.dart';
import '../../widget/donor/custom_donor_drawer.dart';
import '../../widget/receiver/custom_rec_action_buttons.dart';
import '../../widget/receiver/custom_rec_bottom_navbar.dart';
import '../../widget/receiver/custom_reciever_drawer.dart';

class ReceiverHomescreen extends StatelessWidget {
  ReceiverHomescreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(FilterFoodController());
    Get.put(ReceiverHomeScreenControllerImp());
    return GetBuilder<ReceiverHomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F2F3),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
          actions: [
            CustomRecActionbuttons(
              scaffoldKey: scaffoldKey,
            )
          ],
        ),
        endDrawer: const ReceiverDrawer(),
        bottomNavigationBar: const CustomRecBottomNavBar(),
        body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                  title: "ExitAlertTitle".tr,
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
