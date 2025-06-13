import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postdata(String email,String verifycode) async {
    var response = await crud.postData(AppLink.verifycodesignup, {
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
