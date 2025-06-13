import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/home_reciever_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';
import '../../widget/receiver/custom_rec_list.dart';
import '../../widget/receiver/reciever_filter_bottomsheet.dart';

class RecieverHomePage extends StatelessWidget {
  const RecieverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeRecieverControllerImp());

    return Scaffold(
      body: Obx(() {
        // Determine which list to display based on filter status
        final displayList = controller.filtersApplied.value
            ? controller.filteredFood.value
            : controller.food.value;

        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Filter button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const RecieverFilterBottomSheet(),
                        ).then((_) {
                          // Apply filters when bottom sheet closes
                          controller.applyFilters();
                        });
                      },
                      icon: const Icon(
                        Icons.tune,
                        color: AppColor.primaryColor,
                        size: 30,
                      ),
                    ),
                    // Reset filters button
                    Obx(() => controller.filtersApplied.value
                        ? TextButton(
                          onPressed: () {
                            controller.resetFilters();
                          },
                          child: Text(
                            "ResetFilters".tr,
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        )
                        : const SizedBox()),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "RecBodyTitle".tr,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      final foodMap = displayList[index];
                      final foodModel = FoodModel.fromJson(foodMap);

                      return InkWell(
                        onTap: () => controller.goToPageFoodDetails(foodModel),
                        child: CustomReclist(
                          name: foodModel.foodName ?? "",
                          type: foodModel.foodType ?? "",
                          quantity: foodModel.foodQuantity?.toString() ?? "0",
                          image: foodModel.foodImages.isNotEmpty
                              ? foodModel.foodImages.first
                              : "",
                          images: foodModel.foodImages,
                          expireDate: foodModel.foodExpiredate ?? "",
                          description: foodModel.foodDescribtion ?? "",
                          onreserve: () => controller.addfood(
                            foodModel.foodId.toString(),
                            foodModel.foodQuantity ?? 1,
                          ),
                          username: foodModel.usersName ?? "",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),

    );
  }
}