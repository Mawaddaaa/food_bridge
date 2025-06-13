import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetails, {
      "id":id
    });
    return response.fold((l) => l, (r) => r);
  }
}
