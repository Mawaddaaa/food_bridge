import 'package:flutter/material.dart';
import 'package:food_bridge/controller/receiver/notification_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/color.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());

    return GetBuilder<NotificationController>(
      builder: (controller) => HandlingDataView(
        widget: Scaffold(
          appBar: AppBar(
            title: Text("NotificationsTitle".tr),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final item = controller.data[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    leading: const Icon(Icons.notifications_active,
                        color: AppColor.primaryColor, size: 30),
                    title: Text(
                      item['notification_title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          Jiffy.parse(item['notification_datetime']).fromNow(),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['notification_body'],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        statusRequest: controller.statusRequest,
      ),
    );
  }
}
