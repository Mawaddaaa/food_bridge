import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/auth/login.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  MyServices myServices = Get.find();

  StatusRequest? statusRequest = StatusRequest.none;

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
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
login() async {
  if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.postdata(
      email.text,
      password.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int usersApprove = response['data']['users_approve'];
        if (usersApprove == 1) { 
          myServices.sharedPrefernces.setString("id", response['data']['users_id'].toString());
          String userid = myServices.sharedPrefernces.getString("id")!;
          myServices.sharedPrefernces.setString("username", response['data']['users_name']);
          myServices.sharedPrefernces.setString("email", response['data']['users_email']);
          myServices.sharedPrefernces.setString("phone", response['data']['users_phone']);
          if(response['data']['users_role']=="donor"){
            myServices.sharedPrefernces.setString("step", "2");
            await FirebaseMessaging.instance.subscribeToTopic("users");
            await FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offNamed(AppRoute.homedonorpage);
          } else if(response['data']['users_role']=="recipient"){
            myServices.sharedPrefernces.setString("step", "3");
            await FirebaseMessaging.instance.subscribeToTopic("users");
            await FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offNamed(AppRoute.homerecieverpage);
          }
          else if(response['data']['users_role']=="admin"){
            myServices.sharedPrefernces.setString("step", "4");
            await FirebaseMessaging.instance.subscribeToTopic("users");
            await FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offNamed(AppRoute.adminhome);
          }
        } else {
          Get.toNamed(AppRoute.verifyCodeSignUp, arguments: {"email": email.text});
        }
      } else {
        Get.defaultDialog(
            title: "Warning".tr, middleText: "EmailOrPasswordNotCorrect".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
  
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
