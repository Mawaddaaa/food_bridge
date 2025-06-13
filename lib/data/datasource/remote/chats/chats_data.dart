import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/linkapi.dart';
import '../../../model/chats_model.dart';
import '../../../model/message_model.dart';
import '../../../model/user_search_model.dart';

class ChatData {
  Crud crud;

  ChatData(this.crud);

  // Fetch messages between two users
  Future<List<Message>> fetchMessages(String userId, String otherUserId) async {
    final response = await crud.getData(
      AppLink.fetchMessage,
      query: {
        'user_id': userId,       // Already string
        'other_user_id': otherUserId, // Already string
      },
    );

    if (response['status'] == 'success') {
      return (response['messages'] as List)
          .map((msg) => Message.fromJson(msg))
          .toList();
    } else {
      throw Exception(response['message'] ?? 'Failed to load messages');
    }
  }



  // Fetch all chats (last message for each conversation)
  Future<List<Chat>> getAllChats(String userId) async {
    final response = await crud.getData(
      AppLink.fetchConversations,
      query: {
        'user_id': userId, // Send as string - PHP will cast to int
      },
    );

    if (response['status'] == "success") {
      return (response['conversations'] as List)
          .map((chat) => Chat.fromJson(chat))
          .toList();
    } else {
      throw Exception(response['message'] ?? 'Failed to load chats');
    }
  }




  Future<dynamic> sendMessage(String senderId, String receiverId, String message) async {
    final response = await crud.postData(AppLink.sendMessage,
      {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "message": message,
      },
    );

    return response.fold(
          (error) => throw Exception('Failed to send message: $error'),
          (data) {
        if (data['status'] == 'success') {
          return data; 
        } else {
          throw Exception(data['message'] ?? 'Failed to send message');
        }
      },
    );
  }

  Future<List<UserSearchModel>> searchUsers({
    required String query,
    required String currentUserId
  }) async {
    final response = await crud.getData(
      AppLink.searchUsers,
      query: {
        'query': query,
        'current_user_id': currentUserId,
      },
    );

    if (response['status'] == 'success') {
      return (response['users'] as List)
          .map((user) => UserSearchModel.fromJson(user))
          .toList();
    } else {
      throw Exception(response['message'] ?? 'Failed to load search results');
    }
  }
}