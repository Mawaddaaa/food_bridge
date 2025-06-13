import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/controller/profile_controller.dart';
import 'package:food_bridge/controller/settings_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:get/get.dart';

class SettingScreenAdmin extends StatelessWidget {
  const SettingScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    Get.put(ProfileController());
    return ListView(children: [
      Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
        Container(
          height: Get.width / 2.5,
          color: AppColor.primaryColor,
        ),
        Positioned(
          top: Get.width / 4,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: GetBuilder<ProfileController>(builder: (profileController) {
                  String? imageUrl = profileController.data['users_image'];
                  return CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                        ? CachedNetworkImageProvider("${AppLink.image}/$imageUrl")
                        : const AssetImage("assets/images/logo2.png") as ImageProvider,
                  );
                }),
              ),
              const SizedBox(height: 8),
              GetBuilder<ProfileController>(builder: (profileController) {
                String? username = profileController.data['users_name'];
                return Text(
                  username ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.darkGray,
                  ),
                );
              }),
            ],
          ),
        )

      ]),
      const SizedBox(
        height: 110,
      ),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Item1".tr),
                  onTap: () {
                    Get.toNamed(AppRoute.profile);
                  },
                  trailing: const Icon(Icons.person),
                ),
                // ListTile(
                //   title: Text("Item2".tr),
                //   onTap: () {
                //     Get.toNamed(AppRoute.addressview);
                //   },
                //   trailing: const Icon(Icons.location_on_outlined),
                // ),
                ListTile(
                    title: Text("Item3".tr),
                    onTap: () {
                      Get.toNamed(AppRoute.languagesettingsadmin);
                    },
                    trailing: const Icon(Icons.language_outlined)),
                    ListTile(
                    title: Text("Analysis".tr),
                    onTap: () {
                      Get.toNamed(AppRoute.analysisScreen);
                    },
                    trailing: const Icon(Icons.analytics)),
                ListTile(
                    title: Text("Item6".tr),
                    onTap: () {
                      controller.logout();
                    },
                    trailing: const Icon(Icons.exit_to_app))
              ],
            ),
          ))
    ]);
  }
}
