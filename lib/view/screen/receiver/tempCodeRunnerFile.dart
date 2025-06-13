import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/cart_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/view/widget/cart/custom_food_cart_list.dart';
import 'package:food_bridge/view/widget/cart/top_card_cart.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(

      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              
              const SizedBox(
                height: 10,
              ),
              TopCardCart(
                  message:
                      "you have ${cartController.totalcount} items in your list"),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                        cartController.data.length,
                        (index) => CustomFoodCartList(
                              count: "${cartController.data[index].countitems}",
                              name: '${cartController.data[index].foodName}',
                              imagename:
                                  '${cartController.data[index].foodImage}',
                              onAdd: ()async {
                               await cartController.addfood(cartController
                                    .data[index].foodId
                                    .toString(),cartController.data[index].foodQuantity!.toInt());
                                cartController.refreshpage();
                              },
                              onRemove: () async{
                               await cartController.delete(cartController
                                    .data[index].foodId
                                    .toString());
                                cartController.refreshpage();
                              },
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
