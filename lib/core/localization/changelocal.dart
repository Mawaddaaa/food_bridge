import 'package:flutter/material.dart';
import 'package:food_bridge/controller/theme_controller.dart';
import 'package:food_bridge/core/constant/apptheme.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../functions/fcmconfig.dart';

class LocalController extends GetxController {
  var language = Rx<Locale>(const Locale('en'));
  var appTheme = Rx<ThemeData>(themeEnglish); 
  MyServices myServices = Get.find();


  ThemeController get themeController => Get.find<ThemeController>();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPrefernces.setString("lang", langcode);
    appTheme.value = langcode == "ar" ? themeArabic : themeEnglish; 
    Get.changeTheme(appTheme.value);
    Get.updateLocale(locale);
    language.value = locale;

    if (themeController.isDarkMode.value) {
      Get.changeThemeMode(ThemeMode.dark); 
    }
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning".tr, "turnonlocationpermission".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "Warning".tr, "permissionaccesslocation".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
          "Warning".tr, "notuseappwithoutloc".tr);
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPrefernces.getString("lang");
    if (sharedPrefLang == "ar") {
      language.value = const Locale("ar");
      appTheme.value = themeArabic;
    } else if (sharedPrefLang == "en") {
      language.value = const Locale("en");
      appTheme.value = themeEnglish;
    } else {
      language.value = Locale(Get.deviceLocale!.languageCode);
      appTheme.value = themeEnglish;
    }
    super.onInit();
  }
}
