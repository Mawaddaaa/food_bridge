import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_bridge/controller/donor/food_detatils_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/view/widget/donor/food_details_top.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../controller/donor/home_donor_controller.dart';
import '../../../core/constant/routes.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    FoodDetatilsControllerImp controller = Get.put(FoodDetatilsControllerImp());
    HomeDonorControllerImp homedonorcontroller =
        Get.put(HomeDonorControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("DetailsAppBarTitle".tr),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: AppColor.primaryColor,
                onPressed: () async {
                  final result =
                      await Get.toNamed(AppRoute.editItemScreen, arguments: {
                    'food_id': controller.foodModel.foodId,
                    'food_name': controller.foodModel.foodName,
                    'food_type': controller.foodModel.foodType,
                    'food_describtion': controller.foodModel.foodDescribtion,
                    'food_quantity': controller.foodModel.foodQuantity,
                    'food_expiredate': controller.foodModel.foodExpiredate,
                    'food_images': controller.foodModel.foodImages,
                    'address_id': controller.foodModel.addressId,
                  });
                  if (result == true) {
                    await controller.fetchUpdatedFoodDetails(); 
                    final homeController = Get.find<HomeDonorControllerImp>();
                    await homeController.refreshData();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Edit".tr,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: AppColor.primaryColor,
                onPressed: () {
                  Get.defaultDialog(
                    title: "ExitAlertTitle".tr,
                    middleText: "ExitAlertQuestionDelete".tr,
                    textConfirm: "ExitAlertButton1".tr,
                    textCancel: "ExitAlertButton2".tr,
                    confirmTextColor: Colors.white,
                    buttonColor: AppColor.primaryColor,
                    onConfirm: () {
                      homedonorcontroller.deleteFood(
                          controller.foodModel.foodId?.toString() ?? "");
                      Get.back();
                    },
                    onCancel: () {},
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "DetailsButtonDelete".tr,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<FoodDetatilsControllerImp>(
        builder:(controller)=> ListView(
          children: [
            const FoodDetailsTop(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.foodModel.foodName}",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "${controller.foodModel.foodDescribtion}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Divider(height: 30),
                    _buildLabel("Type".tr),
                    _buildValue("${controller.foodModel.foodType}"),
                    const SizedBox(height: 15),
                    _buildLabel("Quantity".tr),
                    _buildValue("${controller.foodModel.foodQuantity}"),
                    const SizedBox(height: 15),
                    _buildLabel("ExpiredDate".tr),
                    _buildValue("${controller.foodModel.foodExpiredate}"),
                    const SizedBox(height: 15),
                    Obx(() {
                      if (controller.remainingTime['expired'] == true) {
                        return _buildValue(
                          "Expired".tr,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        );
                      }
        
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("TimeRemaining".tr),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildTimeBox(
                                  "${controller.remainingTime['days']}", "Days".tr),
                              _buildTimeBox(
                                  "${controller.remainingTime['hours']}",
                                  "Hours".tr),
                              _buildTimeBox(
                                  "${controller.remainingTime['minutes']}",
                                  "Minutes".tr),
                            ],
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 15),
                    _buildLabel("Address".tr),
                    _buildValue("${controller.foodModel.addressName}"),
                    _buildValue(
                        "${controller.foodModel.addressCity} ${controller.foodModel.addressStreet}"),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(
                                controller.foodModel.addressLat ?? 0.0,
                                controller.foodModel.addressLong ?? 0.0,
                              ),
                              initialZoom: 15.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.food_bridge',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    width: 40.0,
                                    height: 40.0,
                                    point: LatLng(
                                      controller.foodModel.addressLat ?? 0.0,
                                      controller.foodModel.addressLong ?? 0.0,
                                    ),
                                    child: const Icon(Icons.location_pin,
                                        color: AppColor.primaryColor, size: 40),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 18,
        color: AppColor.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildValue(String value, {TextStyle? style}) {
    return Text(
      value,
      style: style ??
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.primaryColor),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
