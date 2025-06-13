import 'package:flutter/widgets.dart';
import 'package:food_bridge/controller/auth/signup_controller.dart';
import 'package:food_bridge/view/widget/auth/custom_role_button_auth.dart';
import 'package:get/get.dart';

class CustomRoleButtonRow extends StatelessWidget {
  final bool isRecipient = true;
  const CustomRoleButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder:(controller)=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomRoleButtonAuth(
            title: 'ButtonRole1'.tr,
            isSelected: controller.selectedRole == "donor",
            onPressed: () {
              controller.updateRole("donor");
            },
          ),
          const SizedBox(width: 10),
          CustomRoleButtonAuth(
            title: 'ButtonRole2'.tr,
            isSelected: controller.selectedRole == "recipient", 
            onPressed: () { 
              controller.updateRole("recipient");
            },
          ),
        ],
      ),
    );
  }
}
