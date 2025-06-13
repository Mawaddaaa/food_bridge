import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/admin_home_screen_controller.dart';
import 'package:food_bridge/controller/theme_controller.dart';
import 'package:get/get.dart';
import '../custom_action_button.dart';

class CustomactionbuttonsAdmin extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomactionbuttonsAdmin({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeScreenControllerImp>(builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GetBuilder<ThemeController>(
        builder:(themeController)=> Row(
          children: [
            // CustomActionButton(
            //   icon: Icons.location_on_outlined,
            //   onTap: () {
            //     controller.goMaps();
            //   },
            // ),

            CustomActionButton(
              icon: Icons.notifications_none,
              onTap: () {
                controller.goNotifications();
              },
            ),
            // CustomActionButton(
            //   icon: Icons.search,
            //   onTap: () {
            //     controller.goSearch();
            //   },
            // ),

            CustomActionButton(
              icon: Icons.menu,
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        ),
      ),
    ));
  }
}