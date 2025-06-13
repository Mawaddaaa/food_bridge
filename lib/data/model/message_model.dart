class Message {
  final String id;          // Changed to String
  final String senderId;    // Changed to String
  final String receiverId;  // Changed to String
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final String senderName;
  final String senderImage;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
    required this.isRead,
    required this.senderName,
    required this.senderImage,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'].toString(),
      senderId: json['sender_id'].toString(),
      receiverId: json['receiver_id'].toString(),
      content: json['message'] ?? '',
      timestamp: DateTime.parse(json['timestamp'].toString()),
      isRead: _parseIsRead(json['is_read']), // Use helper function
      senderName: json['sender_name'] ?? '',
      senderImage: json['sender_image'] ?? '',
    );
  }

// Helper function to handle all is_read formats
  static bool _parseIsRead(dynamic isReadValue) {
    if (isReadValue == null) return false;
    if (isReadValue is bool) return isReadValue;
    if (isReadValue is int) return isReadValue == 1;
    if (isReadValue is String) {
      return isReadValue == '1' || isReadValue.toLowerCase() == 'true';
    }
    return false;
  }
}