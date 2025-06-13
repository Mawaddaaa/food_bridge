import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "id":userid
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersid) async {
    var response = await crud.postData(AppLink.deleteorders, {
      "id":ordersid
    });
    return response.fold((l) => l, (r) => r);
  }

   doneorder(String ordersid) async {
    var response = await crud.postData(AppLink.doneorders, {
      "id":ordersid
    });
    return response.fold((l) => l, (r) => r);
  }
}
