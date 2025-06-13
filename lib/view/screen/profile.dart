import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/controller/profile_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/validinput.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
   const Profile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("profileTitle".tr),
        elevation: 0,
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        controller.imageFile != null
                            ? CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(controller.imageFile!),
                        )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: controller.data['users_image'] != null
                                    ? CachedNetworkImageProvider(
                                    "${AppLink.image}/${controller.data['users_image']}")
                                    : null,
                                child: controller.data['users_image'] == null
                                    ? const Icon(Icons.person, size: 60)
                                    : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: InkWell(
                              onTap: () => controller.pickImage(),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CustomTextFormAuth(
                          labeltext: "profileTextForm1".tr,
                          iconData: Icons.person,
                          type: TextInputType.name,
                          mycontroller: controller.username,
                          valid: (val) {
                            return validInput(val!, 3, 100, "username");
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormAuth(
                          labeltext: 'profileTextForm2'.tr,
                          iconData: Icons.phone,
                          type: TextInputType.phone,
                          mycontroller: controller.phone,
                          valid: (val) {
                            return validInput(val!, 8, 20, "phone");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                          controller.updateProfile();
                            }
                      },

                      child: Text(
                        "profilebutton".tr,
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
