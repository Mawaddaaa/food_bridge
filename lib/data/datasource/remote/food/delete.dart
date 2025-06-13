import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class DeleteFoodData {
  Crud crud;

  DeleteFoodData(this.crud);

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteFood, {
      "id":id
    });
    return response.fold((l) => l, (r) => r);
  }
}
