import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class ProfileData {
  Crud crud;

  ProfileData(this.crud);

  getData(String usersId) async {
    var response = await crud.postData(AppLink.viewprofile, {
      "usersId":usersId
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String userid,String name,String phone,String image) async {
    var response = await crud.postData(AppLink.editprofile, {
      "userid":userid,
      "name":name,
      "phone":phone,
      "image":image
    });
    return response.fold((l) => l, (r) => r);
  }

}
