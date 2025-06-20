import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email,String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email":email,
      "verifycode":verifycode
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
