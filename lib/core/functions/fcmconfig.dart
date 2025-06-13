import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:food_bridge/controller/receiver/orders_controller.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}


fcmconfig(){
  FirebaseMessaging.onMessage.listen((message){
    print("---------------Notifications--------");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print(Get.currentRoute);
  if (Get.currentRoute == "/pendingorders" && data['pagename'] == "refreshorderpending" ){
    OrdersController controller = Get.find();
    controller.refreshOrder();
  }
}