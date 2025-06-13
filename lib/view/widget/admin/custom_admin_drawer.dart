import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/admin_home_screen_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:get/get.dart';
import '../../../controller/profile_controller.dart';
import '../../../controller/settings_controller.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AdminHomeScreenControllerImp controller = Get.put(AdminHomeScreenControllerImp());
    SettingsController settingsController = Get.put(SettingsController());
    ProfileController profileController = Get.put(ProfileController());

    return SizedBox(
      width: 250,
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            GetBuilder<ProfileController>(
              builder: (controller) {
                return SizedBox(
                  height: 140,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: controller.imageFile != null
                              ? CircleAvatar(
                            backgroundImage:
                            FileImage(controller.imageFile!),
                          )
                              : controller.data['users_image'] != null
                              ? CircleAvatar(
                            backgroundImage:
                            CachedNetworkImageProvider(
                              "${AppLink.image}/${controller.data['users_image']}",
                            ),
                          )
                              : const CircleAvatar(
                            child: Icon(Icons.person, size: 30),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            controller.username.text.isNotEmpty
                                ? controller.username.text
                                : "User name",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(5),
                children: [
                  drawerItem(Icons.home, "DrawerHome".tr, () {
                    controller.changePageFromDrawer(0);
                  }),
                  drawerItem(Icons.pending_actions, "DrawerRequests".tr, () {
                    controller.changePageFromDrawer(1);
                  }),
                  drawerItem(Icons.chat, "DrawerChats".tr, () {
                    controller.changePageFromDrawer(2);
                  }),
                  drawerItem(Icons.settings, "DrawerSettings".tr, () {
                    controller.changePageFromDrawer(3);
                  }),
                  drawerItem(Icons.person, "DrawerProfile".tr, () {
                    Get.toNamed(AppRoute.profile);
                  }),
                  drawerItem(Icons.info, "DrawerAbout".tr, () {
                    Get.toNamed(AppRoute.aboutus);
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: drawerItem(Icons.logout_outlined, "DrawerLogout".tr, () {
                settingsController.logout();
              }),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        child: Icon(icon, color: AppColor.primaryColor, size: 23),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
