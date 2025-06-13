class UserModel {
  final int usersId;
  final String usersName;
  final String usersEmail;
  final String usersPhone;
  final int usersVerifyCode;
  final int usersApprove;
  final String usersCreate;
  final String usersPassword;
  final String usersRole;
  final String usersImage;

  UserModel({
    required this.usersId,
    required this.usersName,
    required this.usersEmail,
    required this.usersPhone,
    required this.usersVerifyCode,
    required this.usersApprove,
    required this.usersCreate,
    required this.usersPassword,
    required this.usersRole,
    required this.usersImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      usersId: json['users_id'] as int? ?? 0,
      usersName: json['users_name'] as String? ?? '',
      usersEmail: json['users_email'] as String? ?? '',
      usersPhone: json['users_phone'] as String? ?? '',
      usersVerifyCode: json['users_verifycode'] as int? ?? 0,
      usersApprove: json['users_approve'] as int? ?? 0,
      usersCreate: json['users_create'] as String? ?? '',
      usersPassword: json['users_password'] as String? ?? '',
      usersRole: json['users_role'] as String? ?? '',
      usersImage: json['users_image'] as String? ?? 'default.png',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users_id': usersId,
      'users_name': usersName,
      'users_email': usersEmail,
      'users_phone': usersPhone,
      'users_verifycode': usersVerifyCode,
      'users_approve': usersApprove,
      'users_create': usersCreate,
      'users_password': usersPassword,
      'users_role': usersRole,
      'users_image': usersImage,
    };
  }
}
