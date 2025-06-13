import 'package:flutter/material.dart';
import 'package:food_bridge/controller/forgetpassword/resetpassword_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/validinput.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:food_bridge/view/widget/onboarding/custombutton.dart';
import 'package:get/get.dart';

import '../../../widget/auth/custom_text_subtitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: GetBuilder<ResetPasswordControllerImp>(
            builder:(controller)=>
             HandlingDataRequest(
              statusRequest: controller.statusRequest!,
               widget: SingleChildScrollView(
                      child: Padding(
                           padding: const EdgeInsets.all(30.0),
                           child: Column(
                children: [
                  CustomTextSubtitleauth(text: 'ResetPasswordTitle'.tr),
                  const SizedBox(height: 15),
                  CustomTextBodyAuth(text: 'ResetPasswordbody'.tr),
                  const SizedBox(height: 25),
                  Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          GetBuilder<ResetPasswordControllerImp>(
                            builder: (controller) => CustomTextFormAuth(
                                obscureText: controller.isshowpassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                iconData: controller.passwordIcon,
                                mycontroller: controller.password,
                                type: TextInputType.visiblePassword,
                                valid: (val) {
                                  return validInput(val!, 5, 30, "password");
                                },
                                labeltext: "ResetPasswordFormField1".tr),
                          ),
                          const SizedBox(height: 10),
                          GetBuilder<ResetPasswordControllerImp>(
                            builder:(controller)=> CustomTextFormAuth(
                                obscureText: controller.isshowpassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                iconData: controller.passwordIcon,
                                mycontroller: controller.repassword,
                                type: TextInputType.visiblePassword,
                                valid: (val) {
                                  return validInput(val!, 5, 30, "password");
                                },
                                labeltext: "ResetPasswordFormField2".tr),
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  Custombutton(
                    text: "forgetbutton".tr,
                    backgroundColor: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                  ),
                ],
                           ),
                      ),
                    ),
             ),
          )),
    );
  }
}
