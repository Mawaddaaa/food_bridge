import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  bool isshowpassword = true;
  IconData passwordIcon = Icons.visibility_off_outlined;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    passwordIcon = passwordIcon == Icons.visibility_off_outlined
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined;
    update();
  }

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning".tr, middleText: "PasswordNotMatch".tr);
    }
    if(formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordData.postdata(
      email!,
      password.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        Get.defaultDialog(
            title: "Warning".tr, middleText: "TryAgain".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    }
  }

  @override
  resetpassword() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
