import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/reciever/orders_data.dart';
import 'package:food_bridge/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersData.getData(myServices.sharedPrefernces.getString("id")!);
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

  deleteOrders(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.deleteData(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  doneOrders(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.doneorder(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  String printOrderStatus(String val) {
    if (val == "1") {
      return "Approved".tr;
    } 
    else {
      return "Archived".tr;
    }
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
