import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class HomeDonorData {
  Crud crud;

  HomeDonorData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.homeDonor, {
      "id":id
    });
    return response.fold((l) => l, (r) => r);
  }
}
