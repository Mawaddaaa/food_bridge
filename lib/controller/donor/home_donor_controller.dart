import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/donor/home_donor_data.dart';
import 'package:food_bridge/data/datasource/remote/food/delete.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';

abstract class HomeDonorController extends GetxController {
  initialData();
  getdata();
  goToPageFoodDetails(FoodModel foodModel);
}

class HomeDonorControllerImp extends HomeDonorController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeDonorData homeDonorData = HomeDonorData(Get.find());
  DeleteFoodData deleteFoodData = DeleteFoodData(Get.find());

  List<Map<String, dynamic>> food = [];
  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPrefernces.getString("username");
    id = myServices.sharedPrefernces.getString("id")!;
  }

  @override
  void onInit() {
    initialData();
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      var response = await homeDonorData.getData(id!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          food.clear();
          if (response['data'] != null) {
            try {
              if (response['data'] is List) {
                food.addAll(List<Map<String, dynamic>>.from(response['data']));
              } else if (response['data'] is Map) {
                food.add(Map<String, dynamic>.from(response['data']));
              }
            } catch (e) {
              statusRequest = StatusRequest.failure;
            }
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  deleteFood(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteFoodData.deleteData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        food.removeWhere((item) => item['food_id'].toString() == id);
        refreshpage();
      } else {
        Get.snackbar("Error".tr, "faildeletefood".tr);
      }
    } else {
      Get.snackbar("Error".tr, "errormessagedonor".tr);
    }
  }

  refreshpage() {
    getdata();
  }

  @override
  goToPageFoodDetails(foodModel) {
    Get.toNamed(AppRoute.foodDetails, arguments: {"foodmodel": foodModel});
  }

  Future<void> refreshData() async {
    await getdata();
  }
}
