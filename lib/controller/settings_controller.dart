import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  logout() async {
    String userid = myServices.sharedPrefernces.getString("id")!;
    await FirebaseMessaging.instance.unsubscribeFromTopic("users");
    await FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPrefernces.clear();
    Get.offAllNamed(AppRoute.login);
  }

contact() async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'foodbridge600@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'contactusubject'.tr,
      
    }),
  );

  try {
    await launchUrl(emailUri);
  } catch (e) {
    print(e.toString());
  }
}
}
