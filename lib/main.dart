import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/bindings/initialbindings.dart';
import 'package:food_bridge/core/localization/changelocal.dart';
import 'package:food_bridge/core/localization/translation.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA4Su4n39mZyOOv4jpqyZ0PUUwdKfhTSZM", // From google-services.json
      appId: "1:50592630648:android:de73874c73a5bc51e42a8d", // mobilesdk_app_id
      messagingSenderId: "50592630648", // project_number
      projectId: "foodbridge-bbf97", // project_id
      storageBucket: "foodbridge-bbf97.firebasestorage.app", // storage_bucket (adjust if needed)
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return Obx(() {
      return GetMaterialApp(
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        title: 'Food Bridge',
        locale: controller.language.value, 
        theme: controller.appTheme.value, 
        darkTheme: ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: controller.language.value.languageCode == 'ar' ? 'Tajawal' : 'Inter',
          ),
        ),
        themeMode: controller.themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialBinding: Initialbindings(),
        getPages: routes,
      );
    });
  }
}
