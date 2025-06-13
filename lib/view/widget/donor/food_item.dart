import 'package:flutter/material.dart';
import 'package:food_bridge/controller/donor/home_donor_controller.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:food_bridge/view/widget/donor/custom_don_list.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FoodItem extends GetView<HomeDonorControllerImp> {
  final FoodModel foodModel;
  final String name;
  final String type;
  final String quantity;
  final String image;
  final String description;
  final String expiredate;
  final String id;
  final List<String> images;

  const FoodItem({
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
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageFoodDetails(foodModel);
      },
      child: CustomDonlist(
        name: name,
        type: type,
        quantity: quantity,
        image: image.isNotEmpty ? "${AppLink.image}/$image" : "",
        description: description,
        expiredate: expiredate,
        id: id,
        images: images,
        addressid: foodModel.addressId.toString(),
      ),
    );
  }
}

