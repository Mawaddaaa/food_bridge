import 'package:flutter/material.dart';
import 'package:food_bridge/controller/donor/food_detatils_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:get/get.dart';

class FoodDetailsTop extends GetView<FoodDetatilsControllerImp> {
  const FoodDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = controller.foodModel.foodImages ??
        (controller.foodModel.foodImage != null
            ? [controller.foodModel.foodImage!]
            : []);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
          ),
        ),
        Positioned(
          top: 30,
          right: 0,
          left: 0,
          child: Column(
            children: [
              if (imageList.length == 1)
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: InteractiveViewer(
                            child: Image.network(
                              "${AppLink.image}/${imageList.first}",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        "${AppLink.image}/${imageList.first}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else if (imageList.length > 1)
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: imageList.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: InteractiveViewer(
                                child: Image.network(
                                  "${AppLink.image}/${imageList[index]}",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            "${AppLink.image}/${imageList[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
