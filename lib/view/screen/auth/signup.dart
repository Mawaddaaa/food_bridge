import 'package:flutter/material.dart';
import 'package:food_bridge/controller/auth/signup_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/functions/alertexitapp.dart';
import 'package:food_bridge/core/functions/validinput.dart';
import 'package:food_bridge/view/widget/auth/custom_role_button_row.dart';
import 'package:food_bridge/view/widget/auth/custom_terms_auth.dart';
import 'package:food_bridge/view/widget/auth/custom_text_signup_or_signin.dart';
import 'package:food_bridge/view/widget/auth/customtextbodyauth.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:food_bridge/view/widget/onboarding/custombutton.dart';
import 'package:get/get.dart';
import '../../../controller/terms_controller.dart';
import '../../../core/constant/color.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: SafeArea(
          child: GetBuilder<SignUpControllerImp>(
            builder:(controller)=> 
            HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
                  child: Column(
                    children: [
                      Text(
                        "RegisterTitle".tr,
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBodyAuth(
                        text:
                        "RegisterBody".tr,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Form(
                        key: controller.formstate,
                        child: Column(
                          children: [
                            CustomTextFormAuth(
                                mycontroller: controller.username,
                                type: TextInputType.name,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "username");
                                },
                                labeltext: "RegisterFormField1".tr
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormAuth(
                                mycontroller: controller.email,
                                type: TextInputType.emailAddress,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                labeltext: "RegisterFormField2".tr
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GetBuilder<SignUpControllerImp>(
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
                                  labeltext: "RegisterFormField3".tr
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormAuth(
                                mycontroller: controller.phone,
                                type: TextInputType.phone,
                                valid: (val) {
                                  return validInput(val!, 5, 11, "phone");
                                },
                                labeltext: "RegisterFormField4".tr
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Get.locale?.languageCode == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
                        child: Text(
                          "RegisterRoleQuestion".tr,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomRoleButtonRow(),
                      const SizedBox(height: 10),
                      CustomTermsAuth(),
                      const SizedBox(height: 5),
                      Custombutton(
                        text: "RegisterSignupButton".tr,
                        backgroundColor: AppColor.primaryColor,
                        textColor: Colors.white,
                        width: double.infinity,
                        onPressed: () {
                          if (controller.formstate.currentState!.validate()) {
                            final termsController = Get.find<TermsController>();
                            String? checkboxError = termsController.validateCheckbox();
                            if (checkboxError != null) return;

                            controller.signUp();
                          }
                        },
                      ),


                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextSignupOrSignin(
                        text: 'RegisterToLogin'.tr,
                        onPressed: () {
                          controller.goToSignIn();
                        },
                      ),
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
