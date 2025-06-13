// file: lib/controller/users_controller.dart
import 'package:get/get.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/data/model/user_model.dart';

import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/users/users_data.dart';

class UsersController extends GetxController {
  UsersData usersData = UsersData(Get.find());

  List<UserModel> users = [];
  StatusRequest statusRequest = StatusRequest.none;

  getUsers() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await usersData.getUsersData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List data = response['data'];
        users = data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
