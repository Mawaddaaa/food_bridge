import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class HomeRecieverData {
  Crud crud;

  HomeRecieverData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homeReciever, {});
    return response.fold((l) => l, (r) => r);
  }
}
