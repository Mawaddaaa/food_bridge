import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class RemainingTimeData {
  Crud crud;

  RemainingTimeData(this.crud);

  getData(String foodId) async {
    var response = await crud.postData(AppLink.remainingtime, {
      "food_id":foodId
    });
    return response.fold((l) => l, (r) => r);
  }

  getFoodDetails(String foodId) async {
    var response = await crud.postData(AppLink.foodupdated, {
      "food_id":foodId
    });
    return response.fold((l) => l, (r) => r);
  }
}
