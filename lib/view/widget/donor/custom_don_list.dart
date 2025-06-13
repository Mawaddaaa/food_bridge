import 'package:flutter/material.dart';
import 'package:food_bridge/controller/donor/home_donor_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/view/widget/donor/custom_donor_button.dart';
import 'package:get/get.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';

class CustomDonlist extends StatelessWidget {
  final String name;
  final String type;
  final String quantity;
  final String image;
  final String description;
  final String expiredate;
  final String id;
  final String addressid;
  final List<String>? images;

  const CustomDonlist({
    super.key,
    required this.name,
    required this.type,
    required this.quantity,
    required this.image,
    required this.expiredate,
    required this.id,
    required this.description,
    this.images, required this.addressid,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = images ?? [image];

    return GetBuilder<HomeDonorControllerImp>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffFAEFF3),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.white60,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Image Gallery
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    if (imageList.isNotEmpty)
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.network(
                          "${AppLink.image}/${imageList.first}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (imageList.length > 1)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "+${imageList.length - 1} more",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DetailsTitle".trParams({"name": name})),
                    Text("DetailsType".trParams({"type": type})),
                    Text("DetailsDescription"
                        .trParams({"description": description})),
                    Text("DetailsQuantity".trParams({"quantity": quantity})),
                    Text("DetailsExpireDate".trParams({"date": expiredate})),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        CustomDonorButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.editItemScreen, arguments: {
                              'food_id': id,
                              'food_name': name,
                              'food_type': type,
                              'food_describtion': description,
                              'food_quantity': quantity,
                              'food_expiredate': expiredate,
                              'food_images': imageList,
                              'address_id': addressid,
                            });
                          },
                          text: 'Edit'.tr,
                          id: id,
                        ),
                        const SizedBox(width: 10),
                        CustomDonorButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "ExitAlertTitle".tr,
                              middleText: "ExitAlertQuestionDelete".tr,
                              textConfirm: "ExitAlertButton1".tr,
                              textCancel: "ExitAlertButton2".tr,
                              confirmTextColor: Colors.white,
                              buttonColor: AppColor.primaryColor,
                              onConfirm: () {
                                controller.deleteFood(id);
                                Get.back();
                              },
                              onCancel: () {},
                            );
                          },
                          text: 'DetailsButtonDelete'.tr,
                          id: id,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
