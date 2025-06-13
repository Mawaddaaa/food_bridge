import 'package:food_bridge/controller/admin/home_admin_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/admin/food_requests_data.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';

abstract class FoodRequestsController extends GetxController {
  initialData();
  getdata();
  goToPageFoodDetails(FoodModel foodModel);
}

class FoodRequestsControllerImp extends FoodRequestsController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  late FoodModel foodModel;

  FoodRequestsData foodRequestsData = FoodRequestsData(Get.find());
  List food = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPrefernces.getString("username");
    id = myServices.sharedPrefernces.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await foodRequestsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'] != null) {
          food.addAll(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  approveFood(String foodid, String usersid) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await foodRequestsData.approveFood(foodid, usersid);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          food.removeWhere(
              (element) => element['food_id'].toString() == foodid);
          Get.snackbar("success".tr, "approvenotf".tr);
          update();
          final homeController = Get.find<HomeAdminControllerImp>();
          await homeController.getdata();
        } else {
          statusRequest = StatusRequest.failure;
          Get.snackbar("fail".tr, "failapprovenotf".tr);
          update();
         
        }
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("fail".tr, "failapprovenotf".tr);
        update();
        
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  dismissFood(String foodid, String usersid) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await foodRequestsData.dismissFood(foodid, usersid);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          food.removeWhere(
              (element) => element['food_id'].toString() == foodid);
          Get.snackbar("success".tr, "dismissnotf".tr);
          update();
        } else {
          statusRequest = StatusRequest.failure;
          Get.snackbar("fail".tr, "faildismissnotf".tr);
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("fail".tr, "faildismissnotf".tr);
        update();
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  @override
  goToPageFoodDetails(foodModel) {
    Get.toNamed(AppRoute.foodDetailsAdmin, arguments: {"foodmodel": foodModel});
  }
}
