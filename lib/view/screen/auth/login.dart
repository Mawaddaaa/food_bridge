import 'package:flutter/material.dart';
import 'package:food_bridge/controller/auth/login_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/alertexitapp.dart';
import 'package:food_bridge/core/functions/validinput.dart';
import 'package:food_bridge/view/widget/auth/custom_forget_password_auth.dart';
import 'package:food_bridge/view/widget/auth/custom_text_signup_or_signin.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:food_bridge/view/widget/auth/customtexttitleauth.dart';
import 'package:food_bridge/view/widget/auth/logoauth.dart';
import 'package:food_bridge/view/widget/onboarding/custombutton.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: SafeArea(
          child: GetBuilder<LoginControllerImp>(
            builder:(controller)=> 
            HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, right: 30,left: 30),
                  child: Column(
                    children: [
                      const LogoAuth(),
                      CustomTextTitleAuth(text: 'loginTitle'.tr),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextBodyAuth(text: 'loginSubTitle'.tr),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: controller.formstate,
                        child: Column(
                          children: [
                            CustomTextFormAuth(
                                mycontroller: controller.email,
                                type: TextInputType.emailAddress,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                labeltext: "loginFormField1".tr),
                            const SizedBox(
                              height: 15,
                            ),
                            GetBuilder<LoginControllerImp>(
                              builder: (controller) => CustomTextFormAuth(
                                  obscureText: controller.isshowpassword,
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  iconData: controller.passwordIcon,
                                  mycontroller: controller.password,
                                  valid: (val) {
                                    return validInput(val!, 5, 30, "password");
                                  },
                                  type: TextInputType.visiblePassword,
                                  labeltext: "loginFormField2".tr),
                            ),
                          ],
                        ),
                      ),
                      CustomForgetPasswordAuth(onPressed: () {
                        controller.goToForgetPassword();
                      }),
                      const SizedBox(
                        height: 5,
                      ),
                      Custombutton(
                        text: "loginButton1".tr,
                        backgroundColor: AppColor.primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "donthaveanaccount".tr
                      ),
                      CustomTextSignupOrSignin(
                          text: 'createNewAccountText'.tr,
                          onPressed: () {
                            controller.goToSignUp();
                          }),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
