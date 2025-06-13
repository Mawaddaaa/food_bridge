import 'dart:async';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/food/remaining_time.dart';
import 'package:food_bridge/data/model/foodmodel.dart';
import 'package:get/get.dart';

abstract class FoodDetatilsController extends GetxController {}

class FoodDetatilsControllerImp extends FoodDetatilsController {
  late FoodModel foodModel;
  RemainingTimeData remainingTimeData = RemainingTimeData(Get.find());
  late StatusRequest statusRequest;
  
  var remainingTime = {
    'days': 0,
    'hours': 0, 
    'minutes': 0,
    'expired': false,
  }.obs;
  
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
  if (remainingTime['expired'] == true) {
    _timer?.cancel();
    return;
  }

  final minutes = remainingTime['minutes'] as int;
  final hours = remainingTime['hours'] as int;
  final days = remainingTime['days'] as int;

  if (minutes > 0) {
    remainingTime['minutes'] = minutes - 1;
  } else {
    remainingTime['minutes'] = 59;
    if (hours > 0) {
      remainingTime['hours'] = hours - 1;
    } else {
      if (days > 0) {
        remainingTime['days'] = days - 1;
        remainingTime['hours'] = 23;
      } else {
        remainingTime['expired'] = true;
        _timer?.cancel();
      }
    }
  }
  remainingTime.refresh(); // Notify listeners of the change
}

  initialData() {
    foodModel = Get.arguments['foodmodel'];
  }

  getRemainingTime() async {
    statusRequest = StatusRequest.loading;
    var response = await remainingTimeData.getData(foodModel.foodId.toString());
    statusRequest = handlingData(response);
    
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Convert dynamic values to proper types
        final data = response['data'];
        remainingTime.value = {
          'days': int.tryParse(data['days'].toString()) ?? 0,
          'hours': int.tryParse(data['hours'].toString()) ?? 0,
          'minutes': int.tryParse(data['minutes'].toString()) ?? 0,
          'expired': data['expired'] == true,
        };
        
        // Start timer only if not expired
        if (remainingTime['expired'] == false) {
          startTimer();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  
  Future<void> fetchUpdatedFoodDetails() async {
  statusRequest = StatusRequest.loading;
  update();

  try {
    var response = await remainingTimeData.getFoodDetails(foodModel.foodId.toString());
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {
      foodModel = FoodModel.fromJson(response['data']);
      await getRemainingTime(); 
    }
  } catch (e) {
    statusRequest = StatusRequest.serverfailure;
  }
  update();
}

  @override
  void onInit() {
    initialData();
    getRemainingTime();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}