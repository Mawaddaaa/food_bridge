import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/food_requests_controller.dart';
import 'package:food_bridge/controller/admin/home_admin_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:food_bridge/view/widget/admin/food_requst_item.dart';
import 'package:get/get.dart';

class FoodRequest extends StatelessWidget {
  const FoodRequest({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodRequestsControllerImp());
    Get.put(HomeAdminControllerImp());
    return Scaffold(
      body: GetBuilder<FoodRequestsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FoodRequsetTitle".tr,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: 
                   ListView.builder(
                            itemCount: controller.food.length,
                            itemBuilder: (context, index) {
                              try {
                                final foodModel =
                                    FoodModel.fromJson(controller.food[index]);
                                return FoodRequstItem(
                                  foodModel: foodModel,
                                  name: foodModel.foodName ?? "No Name",
                                  type: foodModel.foodType ?? "No Type",
                                  quantity:
                                      foodModel.foodQuantity?.toString() ?? "0",
                                  image: foodModel.foodImages.isNotEmpty
                                      ? foodModel.foodImages.first
                                      : "",
                                  description: foodModel.foodDescribtion ??
                                      "No Description",
                                  expiredate:
                                      foodModel.foodExpiredate ?? "No Date",
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
