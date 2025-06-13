import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';

class QantityAndAdd extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String quantity;
  const QantityAndAdd(
      {super.key, this.onAdd, this.onRemove, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text("ADDbut".tr),
          IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
          Container(alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          width: 50,
          decoration: BoxDecoration(border: Border.all(color: AppColor.primaryColor)),
          child: Text(quantity,style: const TextStyle(fontSize: 20,height: 1.1),),),
          IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          Text("removebut".tr),
        ],
      ),
    );
  }
}
