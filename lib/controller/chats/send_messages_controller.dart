import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/chats/chats_data.dart';
import 'fetch_messages_controller.dart';

class SendMessageController extends GetxController {
  // Dependencies
  final ChatData chatData = ChatData(Get.find());

  // State variables
  var statusRequest = StatusRequest.none.obs; // Reactive status
  late TextEditingController messageController;

  // Sender and receiver IDs
  String? senderId;
  String? receiverId;

  @override
  void onInit() {
    messageController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose(); // Clean up the controller
    super.onClose();
  }

  // Send message method
  Future<void> sendMessage() async {
    // Validate message
    if (messageController.text.isEmpty) {
      Get.snackbar("Error".tr, "emptymessage".tr);
      return;
    }

    // Set loading state
    statusRequest.value = StatusRequest.loading;

    try {
      // Send message to the server
      var response = await chatData.sendMessage(
        senderId!,
        receiverId!,
        messageController.text,
      );

      // Handle response
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == "success") {
          // Clear the input field
          messageController.clear();

          // Refresh messages in the FetchMessagesController
          final fetchMessagesController = Get.find<FetchMessagesController>();
          await fetchMessagesController.fetchMessages(senderId!, receiverId!);
        } else {
          // Handle API failure
          statusRequest.value = StatusRequest.failure;
          Get.snackbar("Error".tr, response['message'] ?? "failmessage".tr);
        }
      }
    } catch (e) {
      // Handle unexpected errors
      statusRequest.value = StatusRequest.serverfailure;
      Get.snackbar("Error".tr, "${"errormessage".tr}: $e");
    }
  }
}
