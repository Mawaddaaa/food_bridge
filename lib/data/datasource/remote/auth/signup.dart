import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username,String password,String email,String phone, String role) async {
    var response = await crud.postData(AppLink.signUp, {
      "username":username,
      "password":password,
      "email":email,
      "phone":phone,
      "role": role,
    });
    return response.fold((l) => l, (r) => r);
  }
}
