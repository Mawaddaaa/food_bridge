import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_bridge/core/constant/color.dart';
import '../auth/customtextformauth.dart';

class QuantitySelector extends StatelessWidget {
  final dynamic controller; // Can be AddItemControllerImp or EditItemControllerImp

  const QuantitySelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quantity Chips Selection
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // Predefined quantity chips
              ...controller.quantities.map((quantity) {
                return Obx(() => ChoiceChip(
                  checkmarkColor: Colors.white,
                  label: Text(
                    quantity.toString(),
                    style: TextStyle(
                      color: controller.selectedQuantity.value == quantity
                          ? Colors.white
                          : AppColor.primaryColor,
                    ),
                  ),
                  selected: controller.selectedQuantity.value == quantity,
                  onSelected: (selected) {
                    controller.selectQuantity(quantity);
                    controller.validateQuantity();
                  },
                  selectedColor: AppColor.primaryColor,
                  backgroundColor: const Color(0xffFAEFF3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: AppColor.primaryColor,
                      width: 1,
                    ),
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                ));
              }).toList(),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Other Quantity Input Field
        Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormAuth(
              labeltext: "Other".tr,
              type: TextInputType.number,
              mycontroller: TextEditingController(text: controller.otherQuantity.value),
              valid: (val) {
                if (controller.selectedQuantity.value == null) {
                  if (val == null || val.isEmpty) {
                    return "QuantityValid".tr;
                  }
                  if (int.tryParse(val) == null) {
                    return "NumberValid".tr;
                  }
                  if (int.parse(val) <= 0) {
                    return "NumberValidmin".tr;
                  }
                }
                return null;
              },
              onChanged: (val) {
                controller.otherQuantity.value = val;
                controller.clearSelection();
                controller.validateQuantity();
              },
              onTap: () {
                controller.clearSelection();
              },
            ),
            if (controller.quantityError.value.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                child: Text(
                  controller.quantityError.value,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        )),
      ],
    );
  }
}