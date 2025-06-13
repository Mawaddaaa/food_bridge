import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;

  StatusRequest? statusRequest = StatusRequest.none;

  @override
  goToSuccessSignUp(verifyCodeSignUp ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postdata(email!, verifyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.sucessSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning".tr,
            middleText: "VerifyCodeNotCorrect".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend(){
    verifyCodeSignUpData.resendData(email!);
  }

}
