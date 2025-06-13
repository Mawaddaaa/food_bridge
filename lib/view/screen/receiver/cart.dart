import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/cart_controller.dart';
import 'package:food_bridge/controller/receiver/reserve_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/view/widget/cart/custom_food_cart_list.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    ReserveController reserveController = Get.put(ReserveController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              reserveController.reserve();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
            ),
            child: Text(
              "RecBodybuttonlist".tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),

      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF6E7E7),
                      Color(0xFFEADBE9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_bag,
                        color: AppColor.primaryColor, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child:Text(
                        'ItemCount'.tr.replaceAll('{count}', cartController.totalcount.toString()),
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // List of food cart items (بدون المستطيل الخارجي)
              ...List.generate(
                cartController.data.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomFoodCartList(
                    count: "${cartController.data[index].countitems}",
                    name: '${cartController.data[index].foodName}',
                    imagename: '${cartController.data[index].foodImage}',
                    onAdd: () async {
                      await cartController.addfood(
                        cartController.data[index].foodId.toString(),
                        cartController.data[index].foodQuantity!.toInt(),
                      );
                      cartController.refreshpage();
                    },
                    onRemove: () async {
                      await cartController.delete(
                        cartController.data[index].foodId.toString(),
                      );
                      cartController.refreshpage();
                    },
                  ),
                ),
              ),

              const SizedBox(height: 100), // مساحة فوق الزر
            ],
          ),
        ),
      ),
    );
  }
}
