import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import '../../../controller/chats/fetch_messages_controller.dart';
import '../../../controller/chats/send_messages_controller.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';
import '../../../data/datasource/remote/chats/chats_data.dart';
import '../../../linkapi.dart';
import '../../widget/donor/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  final String senderId;
  final String receiverId;
  final String partnerName;
  final String partnerImage;

  const ChatScreen({
    required this.senderId,
    required this.receiverId,
    super.key,
    required this.partnerName,
    required this.partnerImage,
  });

  @override
  Widget build(BuildContext context) {
    final fetchMessagesController = Get.put(FetchMessagesController(ChatData(Crud())));
    final SendMessageController sendMessageController = Get.put(SendMessageController());

    sendMessageController.senderId = senderId;
    sendMessageController.receiverId = receiverId;

    fetchMessagesController.fetchMessages(senderId, receiverId);

    final ScrollController scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    return WillPopScope(
      onWillPop: () async {
        Get.back(result: true);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("${AppLink.image}/${partnerImage}"),
              ),
              const SizedBox(width: 8),
              Text(
                partnerName,
                style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh , color: Colors.white,),
              onPressed: () => fetchMessagesController.refreshMessages(
                senderId,
                receiverId,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (fetchMessagesController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (fetchMessagesController.hasError.value) {
                  return Center(
                    child: Text('Error: ${fetchMessagesController.errorMessage}'),
                  );
                }

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(scrollController.position.maxScrollExtent);
                  }
                });

                return ListView.builder(
                  controller: scrollController,
                  reverse: false,
                  itemCount: fetchMessagesController.messages.length,
                  itemBuilder: (context, index) {
                    final message = fetchMessagesController.messages[index];
                    return MessageBubble(
                      message: message.content,
                      isMe: message.senderId == senderId,
                      timestamp: message.timestamp,
                    );
                  },
                );
              }),
            ),
            _MessageInputField(sendMessageController: sendMessageController),
          ],
        ),
      ),
    );
  }
}

class _MessageInputField extends StatelessWidget {
  final SendMessageController sendMessageController;

  const _MessageInputField({required this.sendMessageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: sendMessageController.messageController,
              decoration: InputDecoration(
                hintText: "chatstypeMessage".tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey), // اللون لما مش بكتب
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColor.primaryColor, width: 2), // اللون لما بكتب
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          Obx(() {
            if (sendMessageController.statusRequest.value == StatusRequest.loading) {
              return const CupertinoActivityIndicator();
            }
            return IconButton(
              icon: const Icon(Icons.send, color: AppColor.primaryColor,),
              onPressed: _sendMessage,
            );
          }),
        ],
      ),
    );
  }

  void _sendMessage() {
    sendMessageController.sendMessage();
  }
}
