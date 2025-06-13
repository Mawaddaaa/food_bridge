import 'package:flutter/material.dart';
import 'package:food_bridge/controller/theme_controller.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:get/get.dart';
import '../../../controller/receiver/receiver_home_screen_controller.dart';
import '../custom_action_button.dart';

class CustomRecActionbuttons extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomRecActionbuttons({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiverHomeScreenControllerImp>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GetBuilder<ThemeController>(
                builder:(themeController)=> Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // CustomActionButton(
                    //   icon: Icons.location_on_outlined,
                    //   onTap: () {
                    //     controller.goMaps();
                    //   },
                    // ),
                    CustomActionButton(
                      icon: Icons.search,
                      onTap: () {
                        controller.goSearch();
                      },
                    ),
                    CustomActionButton(
                      icon: Icons.notifications_none,
                      onTap: () {
                        controller.goNotifications();
                      },
                    ),
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
