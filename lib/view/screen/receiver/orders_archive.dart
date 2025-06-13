import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/orders_archive_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/view/widget/receiver/card_archive_list.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("RecItem4".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>  CardArchiveList(listdata: controller.data[index],)),
            )),
      ),
    );
  }
}

