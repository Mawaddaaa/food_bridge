import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/donor/donor_home_screen_controller.dart';
import '../custom_button_appbar.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonorHomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
          color: const Color(0xFFF6F2F3),
          shape:  const CircularNotchedRectangle(),
          notchMargin: 10,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(controller.listPage.length + 1, ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                  onPressed: () {
                    controller.changePage(i);
                  },
                  text: controller.titleButtonAppBar[i],
                  icon: controller.iconsButtonAppBar[i],
                  active: controller.currentPage == i ? true : false,
                );
              }))
            ],
          ),
        ));
  }
}