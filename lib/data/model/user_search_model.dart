class UserSearchModel {
  final String userId;  // Changed from int to String for consistency
  final String userName;
  final String userImage;

  UserSearchModel({
    required this.userId,
    required this.userName,
    required this.userImage,
  });

  factory UserSearchModel.fromJson(Map<String, dynamic> json) {
    return UserSearchModel(
      userId: json['users_id'].toString(), // Ensure it's a string
      userName: json['users_name'] ?? 'Unknown',
      userImage: json['users_image'] ?? '',
    );
  }
}