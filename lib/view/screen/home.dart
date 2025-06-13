import 'package:flutter/material.dart';
import 'package:food_bridge/controller/donor/home_donor_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeDonorControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: GetBuilder<HomeDonorControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Center(
            child: Column(
              children: [
                Text(
                  "Hi ${controller.username}",
                  style: const TextStyle(fontSize: 40),
                ),
                Text(
                  "your id is ${controller.id}",
                  style: const TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemCount: controller.food.length,
                    itemBuilder: (context, index) {
                      final foodItem = controller.food[index];
                      final imageUrl = foodItem['food_image'];

                      if (imageUrl != null && imageUrl.isNotEmpty) {
                        return SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.network(
                            "${AppLink.image}/$imageUrl",
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image);
                            },
                          ),
                        );
                      } else {
                        return const SizedBox(
                          height: 70,
                          width: 70,
                          child: Icon(Icons.fastfood), // Placeholder
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}