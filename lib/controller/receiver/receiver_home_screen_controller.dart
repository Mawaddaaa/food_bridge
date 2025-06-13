import 'package:flutter/material.dart';
import 'package:food_bridge/view/screen/receiver/cart.dart';
import 'package:food_bridge/view/screen/receiver/setting_screen_reciever.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../view/screen/donor/chats_screen.dart';
import '../../view/screen/receiver/receiver_home_page.dart';

abstract class ReceiverHomescreenController extends GetxController{

  changePage(int currentpage) ;

}


class ReceiverHomeScreenControllerImp extends ReceiverHomescreenController{

  int currentPage = 0;

  List<Widget> listPage = [
    const RecieverHomePage(),
    const Cart(),
    const ChatsScreen(),
    const SettingScreenReciever(),

  ];

  List titleButtonAppBar = [
    "RecBottomItem1".tr,
    "RecBottomItem2".tr,
    "RecBottomItem3".tr,
    "RecBottomItem4".tr
  ];

  List<IconData> iconsButtonAppBar = [
    Icons.home,
    Icons.shopping_bag_outlined,
    Icons.chat_outlined,
    Icons.settings,
  ];

  @override
  changePage(int currentpage) {
    currentPage = currentpage;
    update();
  }

  goSearch() {
    Get.toNamed(AppRoute.searchScreen);
  }
  goNotifications() {
    Get.toNamed(AppRoute.notificationsScreen);
  }

  goMaps() {
    Get.toNamed(AppRoute.addressview);
  }
  void changePageFromDrawer(int index) {
    currentPage = index;
    update();
    Get.back();
  }


}