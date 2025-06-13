import 'package:get/get.dart';
import 'package:food_bridge/data/model/message_model.dart';

import '../../data/datasource/remote/chats/chats_data.dart';

class FetchMessagesController extends GetxController {
  final ChatData chatData; // تعيين المتغير ChatData
  FetchMessagesController(this.chatData);

  // Reactive list of messages
  var messages = <Message>[].obs;

  // Reactive loading state
  var isLoading = false.obs;

  // Reactive error state
  var hasError = false.obs;
  String errorMessage = '';

  // Fetch messages from the API
  Future<void> fetchMessages(String senderId, String receiverId) async {
    try {
      hasError(false);
      errorMessage = '';

      // استدعاء دالة fetchMessages من ChatData بدلاً من استخدام crud هنا
      final List<Message> fetchedMessages = await chatData.fetchMessages(senderId, receiverId);

      // تحديث الرسائل بعد جلبها
      messages.value = fetchedMessages;
    } catch (e) {
      // التعامل مع الأخطاء
      hasError(true);
      errorMessage = e.toString();
      Get.snackbar('Error'.tr, errorMessage);
    } finally {
      isLoading(false);
    }
  }

  // Refresh messages
  Future<void> refreshMessages(String senderId, String receiverId) async {
    await fetchMessages(senderId, receiverId);
  }
}
