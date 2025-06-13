import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class HomeAdminData {
  Crud crud;

  HomeAdminData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.adminhome, {});
    return response.fold((l) => l, (r) => r);
  }
}
