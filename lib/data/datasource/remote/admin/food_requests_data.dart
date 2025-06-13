import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class FoodRequestsData {
  Crud crud;

  FoodRequestsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.foodrequests, {});
    return response.fold((l) => l, (r) => r);
  }
  
  approveFood(String foodid, String userid) async {
    var response = await crud.postData(AppLink.foodrequestapprove, {
      "foodid":foodid,
      "usersid":userid
    });
    return response.fold((l) => l, (r) => r);
  }

  dismissFood(String foodid, String userid) async {
    var response = await crud.postData(AppLink.foodrequestdismiss, {
      "foodid":foodid,
      "usersid":userid
    });
    return response.fold((l) => l, (r) => r);
  }
}
