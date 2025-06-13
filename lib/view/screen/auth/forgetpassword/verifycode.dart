import 'package:flutter/material.dart';
import 'package:food_bridge/controller/forgetpassword/verifycode_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:get/get.dart';
import '../../../widget/auth/custom_opt_text_feild.dart';
import '../../../widget/auth/custom_text_subtitleauth.dart';
import '../../../widget/auth/logo_verification.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: [
                  CustomTextSubtitleauth(text: 'verifyCodeTitle'.tr),
                  const SizedBox(height: 15),
                  const LogoVerification(),
                  const SizedBox(height: 15),
                  CustomTextBodyAuth(text: 'verifyCodebody'.tr),
                  const SizedBox(height: 30),
                  buildOtpTextField(
                    onSubmit: (String verificationCode) {
                      controller.goToResetPassword(verificationCode);
                    },
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Center(
                      child: Text(
                        "Resendverifycode".tr,
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
