import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class FilterFoodData {
  Crud crud;
  FilterFoodData(this.crud);

  getData({
    String? foodType,
    int? quantity,
    String? expiration,
    String? sort, // إضافة معامل التصنيف
  }) async {
    var response = await crud.postData(AppLink.filterFood, {
      "food_type": foodType,
      "quantity": quantity,
      "expiration": expiration,
      "sort": sort, // إرسال معامل التصنيف للخادم
    });
    return response.fold((l) => l, (r) => r);
  }
}