import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import '../../../controller/terms_controller.dart';

class CustomTermsAuth extends StatelessWidget {
  final TermsController controller = Get.put(TermsController());

  CustomTermsAuth({super.key});

  void _showTermsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25,bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.assignment,
                      color: AppColor.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "TermsAndConditionsTitle".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "TermsDetails".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.security_rounded,
                      color: AppColor.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "PrivacyPolicyTitle".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "PrivacyDetails".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.acceptTerms,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      "AcceptContinue".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => Checkbox(
                value: controller.isChecked.value,
                onChanged: controller.toggleCheckbox,
                activeColor: AppColor.primaryColor,
                side: BorderSide(
                  color: controller.showError.value
                      ? Colors.red.shade900
                      : Colors.grey.shade600,
                  width: 1.5,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "IAgreeTo".tr,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showTermsSheet(context),
                      child: Text(
                        " ${"TermsAndConditions".tr}",
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primaryColor
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Obx(
              () => controller.showError.value
              ? Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  "ShouldAgreeAlert".tr,
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 12,
                  ),
                ),
              )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}