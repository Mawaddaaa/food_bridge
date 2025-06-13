import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/reciever/archive_data.dart';
import 'package:food_bridge/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(myServices.sharedPrefernces.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersArchiveData.rating(ordersid, comment, rating.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "PendingApproval".tr;
    } else if (val == "1") {
      return "Approved".tr;
    } else {
      return "Archived".tr;
    }
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
