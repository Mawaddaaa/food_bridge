import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid,String foodid) async {
    var response = await crud.postData(AppLink.cartadd, {
      "usersid":usersid,
      "foodid":foodid
    });
    return response.fold((l) => l, (r) => r);
  }

  view(String userid) async {
    var response = await crud.postData(AppLink.cartview, {
      "userid":userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid,String foodid) async {
    var response = await crud.postData(AppLink.cartdelete, {
      "usersid":usersid,
      "foodid":foodid
    });
    return response.fold((l) => l, (r) => r);
  }

  getcountcart(String usersid,String foodid) async {
    var response = await crud.postData(AppLink.fooditemscount, {
      "usersid":usersid,
      "foodid":foodid
    });
    return response.fold((l) => l, (r) => r);
  }
}
