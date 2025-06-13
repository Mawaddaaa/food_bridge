import 'package:food_bridge/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen){
  MyServices myServices = Get.find();
  if (myServices.sharedPrefernces.getString("lang") == "ar"){
      return columnar;
  }else {
    return columnen;
  }
}