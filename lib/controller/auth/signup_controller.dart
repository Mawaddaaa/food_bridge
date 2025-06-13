import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/auth/signup.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest? statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];

  bool isshowpassword = true;
  IconData passwordIcon = Icons.visibility_off_outlined;

  String selectedRole = "donor";

  void updateRole(String role) {
    selectedRole = role;
    update(); 
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    passwordIcon = passwordIcon == Icons.visibility_off_outlined
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          username.text, password.text, email.text, phone.text,selectedRole);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCodeSignUp , arguments: {
            "email":email.text
          });
        } else {
          Get.defaultDialog(
              title: "Warning".tr,
              middleText: "AlreadyExists".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

}
