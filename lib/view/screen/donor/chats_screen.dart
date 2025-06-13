import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/chats/fetch_all_messages_controller.dart';
import '../../../controller/chats/search_users_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../../../data/model/chats_model.dart';
import '../../../linkapi.dart';
import 'chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(FetchAllMessagesController());
    final searchController = Get.put(SearchUserController());
    final currentUserId = Get.find<MyServices>().sharedPrefernces.getString("id") ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatController.fetchAllChats();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("chatsTitle".tr, style: const TextStyle(fontWeight: FontWeight.w500)),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController.searchController,
                    decoration: InputDecoration(
                      hintText: "chatsSearchBar".tr,
                      filled: true,
                      fillColor: const Color(0xFFFFFBFB),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: AppColor.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: AppColor.primaryColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.searchController.clear();
                          searchController.clearSearchResults();
                          searchController.searchText.value = '';
                          chatController.fetchAllChats();
                        },
                      ),
                    ),
                    onChanged: (query) {
                      searchController.searchText.value = query; // Updating reactive variable
                      if (query.isNotEmpty) {
                        searchController.searchUsers(query);
                      } else {
                        searchController.clearSearchResults();
                        chatController.fetchAllChats();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (searchController.searchText.isNotEmpty) {
                return _buildSearchResults(searchController, chatController, currentUserId);
              }
              return _buildChatList(chatController, currentUserId);
            }),
          ),
        ],
      ),

    );
  }

  Widget _buildSearchResults(SearchUserController controller,
      FetchAllMessagesController chatController,
      String currentUserId) {
    return ListView.builder(
      itemCount: controller.users.length,
      itemBuilder: (context, index) {
        final user = controller.users[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: user.userImage.isNotEmpty
                ? NetworkImage("${AppLink.image}/${user.userImage}")
                : null,
            child: user.userImage.isEmpty
                ? Text(user.userName[0].toUpperCase())
                : null,
          ),
          title: Text(user.userName),
          onTap: () async {
            final shouldRefresh = await Get.to<bool>(
                  () => ChatScreen(
                    senderId: currentUserId,
                    receiverId: user.userId, // بدل chat.partnerId
                    partnerName: user.userName, // بدل chat.partnerName
                    partnerImage: user.userImage, // بدل chat.partnerImage
                  )
            );
            if (shouldRefresh == true) {
              chatController.fetchAllChats();
            }
          },
        );
      },
    );
  }

  Widget _buildChatList(FetchAllMessagesController controller, String currentUserId) {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    if (controller.hasError.value) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${controller.errorMessage.toString()}'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.fetchAllChats,
              child: Text("Retry".tr),
            ),
          ],
        ),
      );
    }
    if (controller.chats.isEmpty) {
      return Center(
        child: Text(
            "chatsEmptytext".tr,
            style: const TextStyle(fontSize: 16, color: Colors.grey)),
      );
    }
    return RefreshIndicator(
      onRefresh: controller.fetchAllChats,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemCount: controller.chats.length,
        separatorBuilder: (context, index) => const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey),
        itemBuilder: (context, index) {
          final chat = controller.chats[index];
          return _buildChatListItem(chat, currentUserId, controller);
        },
      ),
    );
  }

  Widget _buildChatListItem(Chat chat, String currentUserId,
      FetchAllMessagesController controller) {
    final time = '${chat.lastMessageTime.hour}:${chat.lastMessageTime.minute.toString().padLeft(2, '0')}';

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: chat.partnerImage.isNotEmpty
            ? NetworkImage("${AppLink.image}/${chat.partnerImage}")
            : null,
        child: chat.partnerImage.isEmpty
            ? Text(
          chat.partnerName.isNotEmpty
              ? chat.partnerName[0].toUpperCase()
              : '?',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        )
            : null,
      ),
      title: Text(
        chat.partnerName.isNotEmpty ? chat.partnerName : 'User ${chat.partnerId}',
        style: TextStyle(
            fontWeight: chat.unreadCount > 0
                ? FontWeight.bold
                : FontWeight.normal),
      ),
      subtitle: Text(
        chat.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: chat.unreadCount > 0
                ? FontWeight.bold
                : FontWeight.normal),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time),
          if (chat.unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle),
              child: Text(
                chat.unreadCount.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () async {
        final shouldRefresh = await Get.to<bool>(
              () => ChatScreen(
                senderId: currentUserId,
                receiverId: chat.partnerId,
                partnerName: chat.partnerName,
                partnerImage: chat.partnerImage,
              )
        );
        if (shouldRefresh == true) {
          controller.fetchAllChats();
        }
      },
    );
  }
}

