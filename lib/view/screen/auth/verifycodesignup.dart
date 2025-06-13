import 'package:flutter/material.dart';
import 'package:food_bridge/controller/auth/verifycodesignup_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/view/widget/auth/custom_text_subtitleauth.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:get/get.dart';
import '../../widget/auth/custom_opt_text_feild.dart';
import '../../widget/auth/logo_verification.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  CustomTextSubtitleauth(text: 'verifyCodeTitle'.tr),
                  const SizedBox(height: 15),
                  const LogoVerification(),
                  const SizedBox(height: 15),
                  CustomTextBodyAuth(text: 'verifyCodebody'.tr),
                  const SizedBox(height: 30),
                  buildOtpTextField(onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Center(child:
                    Text(
                      "Resendverifycode".tr,
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primaryColor
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
