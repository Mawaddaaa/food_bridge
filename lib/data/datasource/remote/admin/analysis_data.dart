import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';

class AnalysisData {
  Crud crud;

  AnalysisData(this.crud);

  foodStatusCount() async {
    var response = await crud.postData(AppLink.foodstatussummary, {});
    return response.fold((l) => l, (r) => r);
  }
  ordersratingSummary() async {
    var response = await crud.postData(AppLink.ordersratingsummary, {});
    return response.fold((l) => l, (r) => r);
  }
}
