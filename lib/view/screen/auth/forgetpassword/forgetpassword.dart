import 'package:flutter/material.dart';
import 'package:food_bridge/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/validinput.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:food_bridge/view/widget/onboarding/custombutton.dart';
import 'package:get/get.dart';
import '../../../widget/auth/custom_text_subtitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: GetBuilder<ForgetPasswordControllerImp>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest!,
                widget: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        CustomTextSubtitleauth(text: 'forgetTitle'.tr),
                        const SizedBox(height: 15),
                        CustomTextBodyAuth(text: 'forgetbody'.tr),
                        const SizedBox(height: 25),
                        Form(
                          key: controller.formstate,
                          child: CustomTextFormAuth(
                              mycontroller: controller.email,
                              type: TextInputType.emailAddress,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              labeltext: "loginFormField1".tr),
                        ),
                        const SizedBox(height: 20),
                        Custombutton(
                          text: "forgetbutton".tr,
                          backgroundColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            controller.checkemail();
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
