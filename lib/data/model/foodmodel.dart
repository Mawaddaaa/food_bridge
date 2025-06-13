import 'dart:convert';

class FoodModel {
  int? foodId;
  String? foodName;
  String? foodDescribtion;
  String? foodImage; 
  List<String> foodImages; 
  String? foodType;
  int? foodQuantity;
  int? foodUsers;
  int? foodActive;
  String? foodDatetime;
  String? foodStatus;
  String? foodExpiredate;
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersPassword;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;
  String? usersRole;
  int? foodAddressId;
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;


  FoodModel({
    this.foodId,
    this.foodName,
    this.foodDescribtion,
    this.foodImage,
    List<String>? foodImages,
    this.foodType,
    this.foodQuantity,
    this.foodUsers,
    this.foodActive,
    this.foodDatetime,
    this.foodStatus,
    this.foodExpiredate,
    this.usersId,
    this.usersName,
    this.usersEmail,
    this.usersPhone,
    this.usersPassword,
    this.usersVerifycode,
    this.usersApprove,
    this.usersCreate,
    this.usersRole,
    this.addressId,
    this.addressName,
    this.addressUsersid,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.foodAddressId
  }) : foodImages = foodImages ?? (foodImage != null ? [foodImage] : []);

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      foodId: json['food_id'],
      foodName: json['food_name'],
      foodDescribtion: json['food_describtion'],
      foodImage: json['food_image'],  // Preserve single image
      foodImages: json['food_images'] != null
          ? List<String>.from(jsonDecode(json['food_images']))
          : (json['food_image'] != null ? [json['food_image']] : []),
      foodType: json['food_type'],
      foodQuantity: json['food_quantity'],
      foodUsers: json['food_users'],
      foodActive: json['food_active'],
      foodDatetime: json['food_datetime'],
      foodStatus: json['food_status'],
      foodExpiredate: json['food_expiredate'],
      usersId: json['users_id'],
      usersName: json['users_name'],
      usersEmail: json['users_email'],
      usersPhone: json['users_phone'],
      usersPassword: json['users_password'],
      usersVerifycode: json['users_verifycode'],
      usersApprove: json['users_approve'],
      usersCreate: json['users_create'],
      usersRole: json['users_role'],
      addressId : json['address_id'],
      addressName : json['address_name'],
      addressUsersid : json['address_usersid'],
      addressCity : json['address_city'],
      addressStreet : json['address_street'],
      addressLat : json['address_lat'],
      addressLong : json['address_long'],
      foodAddressId : json['food_address_id']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_id'] = foodId;
    data['food_name'] = foodName;
    data['food_describtion'] = foodDescribtion;
    data['food_image'] = foodImages.isNotEmpty ? foodImages.first : null;
    data['food_images'] = jsonEncode(foodImages);
    data['food_type'] = foodType;
    data['food_quantity'] = foodQuantity;
    data['food_users'] = foodUsers;
    data['food_active'] = foodActive;
    data['food_datetime'] = foodDatetime;
    data['food_status'] = foodStatus;
    data['food_expiredate'] = foodExpiredate;
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_password'] = usersPassword;
    data['users_verifycode'] = usersVerifycode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    data['users_role'] = usersRole;
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_usersid'] = addressUsersid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['food_address_id'] = foodAddressId;
    return data;
  }
}