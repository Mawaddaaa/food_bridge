// file: lib/data/datasource/remote/users_data.dart
import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);

  Future getUsersData() async {
    var response = await crud.postData(AppLink.viewUsers, {});
    return response.fold((l) => l, (r) => r);
  }
}
