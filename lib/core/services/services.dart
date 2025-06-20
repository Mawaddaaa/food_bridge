import 'package:food_bridge/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPrefernces;

  Future<MyServices> init() async {
    sharedPrefernces = await SharedPreferences.getInstance();
    return this;
  }


}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  Get.put(ThemeController());
}
