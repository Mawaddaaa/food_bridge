import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_bridge/controller/receiver/food_details_reciever_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/view/widget/receiver/food_details_top_rec.dart';
import 'package:food_bridge/view/widget/receiver/qantity_and_add.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/class/statusrequest.dart';

class FoodDetailsReciever extends StatelessWidget {
  const FoodDetailsReciever({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodDetailsRecieverControllerImp());


    return Scaffold(
      appBar: AppBar(
        title: Text("DetailsAppBarTitle".tr),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.foodcart);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "GOcart".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: GetBuilder<FoodDetailsRecieverControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const FoodDetailsTopRec(),
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
                      const SizedBox(height: 10),
                      QantityAndAdd(
                        onAdd: () => controller.add(),
                        onRemove: () => controller.remove(),
                        quantity: "${controller.countitems}",
                      ),
                      const SizedBox(height: 15),
                      _buildLabel("ExpiredDate".tr),
                      _buildValue("${controller.foodModel.foodExpiredate}"),
                      const SizedBox(height: 15),
                      _buildLabel("Address".tr),
                      _buildValue("${controller.foodModel.addressName}"),
                      _buildValue("${controller.foodModel.addressCity} ${controller.foodModel.addressStreet}"),
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
                          child: const Icon(Icons.location_pin, color:AppColor.primaryColor, size: 40),
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
        );}

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

  Widget _buildValue(String value) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
