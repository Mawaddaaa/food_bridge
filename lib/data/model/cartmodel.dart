class CartModel {
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartFoodid;
  int? foodId;
  String? foodName;
  String? foodDescribtion;
  String? foodImage;
  String? foodType;
  int? foodQuantity;
  int? foodUsers;
  int? foodActive;
  String? foodDatetime;
  String? foodStatus;
  String? foodExpiredate;

  CartModel(
      {this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartFoodid,
      this.foodId,
      this.foodName,
      this.foodDescribtion,
      this.foodImage,
      this.foodType,
      this.foodQuantity,
      this.foodUsers,
      this.foodActive,
      this.foodDatetime,
      this.foodStatus,
      this.foodExpiredate});

  CartModel.fromJson(Map<String, dynamic> json) {
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartFoodid = json['cart_foodid'];
    foodId = json['food_id'];
    foodName = json['food_name'];
    foodDescribtion = json['food_describtion'];
    foodImage = json['food_image'];
    foodType = json['food_type'];
    foodQuantity = json['food_quantity'];
    foodUsers = json['food_users'];
    foodActive = json['food_active'];
    foodDatetime = json['food_datetime'];
    foodStatus = json['food_status'];
    foodExpiredate = json['food_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_foodid'] = this.cartFoodid;
    data['food_id'] = this.foodId;
    data['food_name'] = this.foodName;
    data['food_describtion'] = this.foodDescribtion;
    data['food_image'] = this.foodImage;
    data['food_type'] = this.foodType;
    data['food_quantity'] = this.foodQuantity;
    data['food_users'] = this.foodUsers;
    data['food_active'] = this.foodActive;
    data['food_datetime'] = this.foodDatetime;
    data['food_status'] = this.foodStatus;
    data['food_expiredate'] = this.foodExpiredate;
    return data;
  }
}