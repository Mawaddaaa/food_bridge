import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/home_admin_controller.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:food_bridge/view/widget/admin/custom_food_home_admin.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FoodItemAdmin extends GetView<HomeAdminControllerImp> {
  final FoodModel foodModel;
  final String name;
  final String type;
  final String quantity;
  final String image;
  final String description;
  final String expiredate;
  final String id;
  final List<String> images;
  final String username;

  const FoodItemAdmin({
    super.key,
    required this.foodModel,
    required this.name,
    required this.type,
    required this.quantity,
    required this.image,
    required this.description,
    required this.expiredate,
    required this.id,
    required this.images,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageFoodDetails(foodModel);
      },
      child: CustomFoodHomeAdmin(
        name: name,
        type: type,
        quantity: quantity,
        image: image.isNotEmpty ? "${AppLink.image}/$image" : "",
        description: description,
        expiredate: expiredate,
        id: id,
        images: images,
        username: foodModel.usersName ?? "",
      ),
    );
  }
}

