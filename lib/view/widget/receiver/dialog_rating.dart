import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/orders_archive_controller.dart';
import 'package:food_bridge/core/constant/app_image_asset.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            title: Text(
              'RatingDialog'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            message: Text(
              'Star'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            image: Image.asset(
              AppImageAsset.logo,
              width: 200,
              height: 200,
            ),
            submitButtonText: 'submitbut'.tr,
            submitButtonTextStyle:
                const TextStyle(color: AppColor.primaryColor),
            commentHint: 'hinttext'.tr,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              OrdersArchiveController controller = Get.find();
              controller.submitRating(
                  ordersid, response.rating, response.comment);
            },
          ));
}
