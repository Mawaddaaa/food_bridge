import 'package:flutter/material.dart';
import 'package:food_bridge/controller/auth/successsignup_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:food_bridge/view/widget/onboarding/custombutton.dart';
import 'package:get/get.dart';
import '../../widget/auth/custom_text_subtitleauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Icon(Icons.check_circle_outline,
                      size: 200, color: AppColor.primaryColor
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextSubtitleauth(text: "SuccessSignupTitle".tr),
                const SizedBox(height: 30),
                CustomTextBodyAuth(text: "SuccessSignupBody".tr),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: SizedBox(
                    width: double.infinity,
                    child: Custombutton(
                      text: "SuccessSignupButton".tr,
                      backgroundColor: AppColor.primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        controller.goToPageLogin();
                      },
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
}
