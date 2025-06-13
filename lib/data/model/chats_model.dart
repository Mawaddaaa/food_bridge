import 'package:flutter/cupertino.dart';

class Chat {
  final String partnerId;
  final String partnerName;
  final String partnerImage;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;

  Chat({
    required this.partnerId,
    required this.partnerName,
    required this.partnerImage,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    // Debug print to see raw values
    debugPrint('Raw partner_id: ${json['partner_id']} (type: ${json['partner_id']?.runtimeType})');
    debugPrint('Raw unread_count: ${json['unread_count']} (type: ${json['unread_count']?.runtimeType})');

    return Chat(
      partnerId: json['partner_id'].toString(), // Force string conversion
      partnerName: json['partner_name'] ?? '',
      partnerImage: json['partner_image'] ?? '',
      lastMessage: json['last_message'] ?? '',
      lastMessageTime: DateTime.parse(json['last_message_time'].toString()),
      unreadCount: int.tryParse(json['unread_count'].toString()) ?? 0, // Force int conversion
    );
  }
}