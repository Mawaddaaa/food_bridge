import 'package:flutter/material.dart';
import 'package:food_bridge/view/screen/admin/admin_home_page.dart';
import 'package:food_bridge/view/screen/admin/food_request.dart';
import 'package:food_bridge/view/screen/admin/setting_screen_admin.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../view/screen/donor/chats_screen.dart';

abstract class AdminHomeScreenController extends GetxController {
  changePage(int currentpage);
}

class AdminHomeScreenControllerImp extends AdminHomeScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const AdminHomePage(),
    const FoodRequest(),
    const ChatsScreen(),
    const SettingScreenAdmin(),
  ];

  List titleButtonAppBar = [
    "BottomItem1".tr,
    "Requests".tr,
    "BottomItem3".tr,
    "BottomItem4".tr
  ];

  List<IconData> iconsButtonAppBar = [
    Icons.home,
    Icons.pending_actions,
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

  goSearch() {
    Get.toNamed(AppRoute.searchScreen);
  }
  void changePageFromDrawer(int index) {
    currentPage = index;
    update();
    Get.back();
  }
}
