import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class ReserveData {
  Crud crud;

  ReserveData(this.crud);

  reserve(Map data) async {
    var response = await crud.postData(AppLink.reserve, data);
    return response.fold((l) => l, (r) => r);
  }
}
