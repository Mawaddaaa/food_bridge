import 'package:food_bridge/controller/donor/home_donor_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/food/delete.dart';
import 'package:get/get.dart';

abstract class DeleteFoodController extends GetxController {
  initialData();
  deleteFood(String id);
}

class DeleteFoodControllerImp extends DeleteFoodController {
  final HomeDonorControllerImp controller = Get.find();
  MyServices myServices = Get.find();

  String? username;
  String? id;

  DeleteFoodData deleteFoodData = DeleteFoodData(Get.find());

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPrefernces.getString("username");
    id = myServices.sharedPrefernces.getString("id")!;
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  deleteFood(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteFoodData.deleteData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        controller.food.removeWhere((item) => item['food_id'] == id);
        Get.offAllNamed(AppRoute.homedonorpage);
      } else {
        Get.snackbar("Error", "Failed to delete food item");
      }
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
    update();
  }
  
}
