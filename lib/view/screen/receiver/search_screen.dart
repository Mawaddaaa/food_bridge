import 'package:flutter/material.dart';
import 'package:food_bridge/controller/food/search.dart';
import 'package:get/get.dart';
import '../../../controller/receiver/home_reciever_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../../data/model/foodmodel.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/receiver/custom_rec_list.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchFoodControllerImp controller = Get.put(SearchFoodControllerImp());
  final HomeRecieverControllerImp homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchRecTitle".tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomTextFormAuth(
              mycontroller: controller.searchController,
              type: TextInputType.text,
              valid: (val) => validInput(val!, 1, 100, "Search"),
              labeltext: "SearchDetial".tr,
              iconData: Icons.search,
              onChanged: (value) => controller.onSearchChanged(value),
            ),
          ),
          Expanded(
            child: GetBuilder<SearchFoodControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: _buildSearchResults(controller),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchResults(SearchFoodControllerImp controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.searchResults.isNotEmpty)
            Text(
              "SearchRecBody".tr,
              style: const TextStyle(fontSize: 18),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => controller.searchFood(controller.searchController.text),
              child: ListView.builder(
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  final foodMap = controller.searchFoodList[index];
                  final foodModel = FoodModel.fromJson(foodMap);
                  return InkWell(
                    onTap: () {
                      if (foodModel.addressLat == null) {
                        final homeItem = homeController.food.firstWhere(
                              (item) => item['food_id'] == foodModel.foodId,
                          orElse: () => null,
                        );

                        if (homeItem != null) {
                          controller.goToPageFoodDetails(
                              FoodModel.fromJson({
                                ...foodMap,
                                'address_lat': homeItem['address_lat'],
                                'address_long': homeItem['address_long'],
                                'address_name': homeItem['address_name'],
                                'address_city': homeItem['address_city'],
                                'address_street': homeItem['address_street'],
                              })
                          );
                          return;
                        }
                      }
                      controller.goToPageFoodDetails(foodModel);
                    },
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
                      onreserve: () => homeController.addfood(
                        foodModel.foodId.toString(),
                        foodModel.foodQuantity ?? 1,
                      ),
                      username: foodModel.usersName ?? "",
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}