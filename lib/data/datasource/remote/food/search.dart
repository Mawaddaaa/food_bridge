import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class SearchFoodData {
  Crud crud;

  SearchFoodData(this.crud);

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchFood, {
      "search": search
    });
    return response.fold((l) => l, (r) => r);
  }
}
