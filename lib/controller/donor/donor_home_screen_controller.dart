import 'package:flutter/material.dart';
import 'package:food_bridge/view/screen/donor/donor_home_page.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../view/screen/donor/chats_screen.dart';
import '../../view/screen/donor/goals_screen.dart';
import '../../view/screen/donor/settings_screen_donor.dart';

abstract class DonorHomescreenController extends GetxController {
  changePage(int currentpage);
}

class DonorHomeScreenControllerImp extends DonorHomescreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const DonorHomePage(),
    const GoalsScreen(),
    ChatsScreen(),
    const SettingsScreenDonor(),
  ];

  List titleButtonAppBar = [
    "BottomItem1".tr,
    "BottomItem2".tr,
    "BottomItem3".tr,
    "BottomItem4".tr
  ];

  List<IconData> iconsButtonAppBar = [
    Icons.home,
    Icons.trending_up,
    Icons.chat_outlined,
    Icons.settings,
  ];

  @override
  changePage(int currentpage) {
    currentPage = currentpage;
    update();
  }

  goNotifications() {
    Get.toNamed(AppRoute.notificationsScreen);
  }

  goadditemscreen() {
    Get.toNamed(AppRoute.additemScreen);
  }

  goMaps() {
    Get.toNamed(AppRoute.addressview);
  }

  void changePageFromDrawer(int index) {
    currentPage = index;
    update();
    Get.back();
  }

  goSearch() {
    Get.toNamed(AppRoute.searchScreen);
  }
}
