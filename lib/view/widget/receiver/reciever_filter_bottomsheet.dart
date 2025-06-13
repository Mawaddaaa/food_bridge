import 'package:flutter/material.dart';
import 'package:food_bridge/controller/food/filter.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import '../../../controller/receiver/home_reciever_controller.dart';

class RecieverFilterBottomSheet extends StatelessWidget {
  const RecieverFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.find<FilterFoodController>();
    final homeController = Get.find<HomeRecieverControllerImp>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(
              "FilterFood".tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 18),

            // Food Type - TextField
            _buildSectionTitle("foodType".tr),
            const SizedBox(height: 10),
            TextField(
              controller: filterController.typeController,
              decoration: InputDecoration(
                hintText: 'searchtype'.tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    filterController.clearFoodType();
                  },
                ),
              ),
              onChanged: filterController.updateFoodType,
            ),

            const SizedBox(height: 20),

            // Quantity
            _buildSectionTitle("Quantity".tr),
            const SizedBox(height: 10),
            Obx(() => _buildHorizontalButtons(
              options: filterController.quantities,
              selected: filterController.selectedQuantity.value,
              onSelected: filterController.updateQuantity,
            )),

            const SizedBox(height: 20),

            // Expiration Date
            _buildSectionTitle("ExpirationDate".tr),
            const SizedBox(height: 10),
            Obx(() => _buildHorizontalButtons(
              options: filterController.expirationOptions,
              selected: filterController.selectedExpiration.value,
              onSelected: filterController.updateExpiration,
            )),

            const SizedBox(height: 20),

            // Distance Filter Section
            Obx(() => Column(
              children: [
                // Distance Filter Toggle
                Row(
                  children: [
                    Checkbox(
                      value: filterController.isDistanceFilterEnabled.value,
                      onChanged: (value) {
                        filterController.isDistanceFilterEnabled.value = value!;
                        if (value) {
                          filterController.getCurrentLocation();
                        }
                      },
                      activeColor: AppColor.primaryColor,
                    ),
                    Text(
                      "Enable Distance Filter".tr,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),

                // Distance Slider (only visible when enabled)
                if (filterController.isDistanceFilterEnabled.value) ...[
                  const SizedBox(height: 10),
                  _buildSectionTitle("Maximum Distance".tr),
                  Slider(
                    value: filterController.distance.value,
                    min: 0.5,
                    max: 20,
                    divisions: 39,
                    label: "${filterController.distance.value.toStringAsFixed(1)} km",
                    activeColor: AppColor.primaryColor,
                    inactiveColor: AppColor.primaryColor.withOpacity(0.3),
                    onChanged: filterController.updateDistance,
                  ),
                  Text(
                    'ShowDistance'.tr.replaceAll(
                      '{distance}',
                      filterController.distance.value.toStringAsFixed(1),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),

                ],
              ],
            )),

            const SizedBox(height: 15),

            // Sort By
            _buildSectionTitle("SortBy".tr),
            const SizedBox(height: 10),
            Obx(() => Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Newest".tr),
                    value: 'newest',
                    groupValue: filterController.sortBy.value,
                    activeColor: AppColor.primaryColor,
                    onChanged: filterController.updateSortBy,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text("Closest".tr),
                    value: 'closest',
                    groupValue: filterController.sortBy.value,
                    activeColor: AppColor.primaryColor,
                    onChanged: (value) {
                      if (value != null) {
                        filterController.updateSortBy(value);
                        if (value == 'closest') {
                          filterController.getCurrentLocation();
                        }
                      }
                    },
                  ),
                ),
              ],
            )),

            const SizedBox(height: 20),

            // Apply and Reset Buttons
            Row(
              children: [
                // Reset Button
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      filterController.clearAllFilters();
                    },
                    child: Text(
                      "Reset".tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                // Apply Button
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      if (filterController.sortBy.value == 'closest' &&
                          !filterController.isDistanceFilterEnabled.value) {
                        Get.snackbar(
                          "Notice".tr,
                          "Distance filter is recommended when sorting by closest".tr,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }

                      await filterController.getFilterParams();
                      await homeController.applyFilters();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Apply".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Get.locale?.languageCode == 'ar'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
        textAlign: Get.locale?.languageCode == 'ar'
            ? TextAlign.right
            : TextAlign.left,
      ),
    );
  }
  Widget _buildHorizontalButtons({
    required List<String> options,
    required String? selected,
    required Function(String) onSelected,
  }) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = options[index];
          final isSelected = selected == item;
          return ChoiceChip(
            label: Text(item),
            checkmarkColor: Colors.white,
            selected: isSelected,
            selectedColor: AppColor.primaryColor,
            backgroundColor: Colors.grey[200],
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (_) => onSelected(item),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: options.length,
      ),
    );
  }
}