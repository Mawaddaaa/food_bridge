import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/admin/analysis_data.dart';
import 'package:get/get.dart';

class AnalysisController extends GetxController {
  AnalysisData analysisData = AnalysisData(Get.find());

   late StatusRequest statusRequest;
   List data = [];

  RxList<Map<String, dynamic>> foodStatusData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ordersRatingData = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getFoodStatusCount();
    getOrdersRating();
    super.onInit();
  }

  getFoodStatusCount() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await analysisData.foodStatusCount();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        foodStatusData.value =
            List<Map<String, dynamic>>.from(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getOrdersRating() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await analysisData.ordersratingSummary();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        ordersRatingData.value =
            List<Map<String, dynamic>>.from(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
