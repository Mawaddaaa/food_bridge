import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/home_admin_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:food_bridge/view/widget/admin/food_item_admin.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeAdminControllerImp()); 

    return Scaffold(
      body: GetBuilder<HomeAdminControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FoodListsTitle".tr,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child:  controller.food.isEmpty && controller.statusRequest == StatusRequest.success
                        ? Center(child: Text("FoodEmptyRequsets".tr))
                        : ListView.builder(
                            itemCount: controller.food.length,
                            itemBuilder: (context, index) {
                              try {
                                final foodModel = FoodModel.fromJson(controller.food[index]);
                                return FoodItemAdmin(
                                  foodModel: foodModel,
                                  name: foodModel.foodName ?? "No Name",
                                  type: foodModel.foodType ?? "No Type",
                                  quantity: foodModel.foodQuantity?.toString() ?? "0",
                                  image: foodModel.foodImages.isNotEmpty
                                      ? foodModel.foodImages.first
                                      : "",
                                  description: foodModel.foodDescribtion ?? "No Description",
                                  expiredate: foodModel.foodExpiredate ?? "No Date",
                                  id: foodModel.foodId?.toString() ?? "",
                                  images: foodModel.foodImages,
                                  username: foodModel.usersName ?? "",

                                );
                              } catch (e) {
                                return ListTile(
                                  title: Text("InvalidFood".tr),
                                );
                              }
                            },
                          ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}