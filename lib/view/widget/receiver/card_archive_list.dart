import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/orders_archive_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/data/model/orders_model.dart';
import 'package:food_bridge/view/widget/receiver/dialog_rating.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardArchiveList extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardArchiveList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${'OrderNumber'.tr} : ${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
                "${"OrderStatus".tr} : ${controller.printOrderStatus(listdata.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: AppColor.secondaryColor,
                  textColor: Colors.white,
                  child: Text("Details".tr),
                ),
                const SizedBox(
                  width: 10,
                ),
              if(listdata.ordersRating == 0)  MaterialButton(
                  onPressed: () {
                    showDialogRating(context,listdata.ordersId!.toString());
                  },
                  color: AppColor.secondaryColor,
                  textColor: Colors.white,
                  child: Text("Rating".tr),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
