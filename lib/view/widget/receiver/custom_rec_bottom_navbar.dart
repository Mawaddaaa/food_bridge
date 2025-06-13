import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/receiver/receiver_home_screen_controller.dart';
import '../custom_button_appbar.dart';

class CustomRecBottomNavBar extends StatelessWidget {
  const CustomRecBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiverHomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
          color: const Color(0xFFF6F2F3),
          shape:  const CircularNotchedRectangle(),
          notchMargin: 10,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(controller.listPage.length, ((index) => CustomButtonAppBar(
                onPressed: () {
                  controller.changePage(index);
                },
                text: controller.titleButtonAppBar[index],
                icon: controller.iconsButtonAppBar[index],
                active: controller.currentPage == index ? true : false,
              )))
            ],
          ),
        ));
  }
}