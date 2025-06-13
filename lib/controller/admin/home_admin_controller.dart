import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/admin/home_data.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';

abstract class HomeAdminController extends GetxController {
  initialData();
  getdata();
  goToPageFoodDetails(FoodModel foodModel);
}

class HomeAdminControllerImp extends HomeAdminController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  late FoodModel foodModel;

  HomeAdminData homeAdminData = HomeAdminData(Get.find());
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
  
  try {
    var response = await homeAdminData.getData();
    statusRequest = handlingData(response);
    
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        food.clear();
        if (response['data'] != null) {
          food.addAll(response['data']);
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  } catch (e) {
    statusRequest = StatusRequest.serverfailure;
    update();
  }
}

  @override
  goToPageFoodDetails(foodModel) {
    Get.toNamed(AppRoute.foodDetailsAdmin,
        arguments: {"foodmodel": foodModel});
  }
}
