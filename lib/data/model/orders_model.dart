class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersStatus;
  int? ordersAddress;
  int? ordersRating;
  String? ordersRatingcomment;
  String? ordersDatetime;
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersStatus,
      this.ordersAddress,
      this.ordersRating,
      this.ordersRatingcomment,
      this.ordersDatetime,
      this.addressId,
      this.addressName,
      this.addressUsersid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersStatus = json['orders_status'];
    ordersAddress = json['orders_address'];
    ordersRating = json['orders_rating'];
    ordersRatingcomment = json['orders_ratingcomment'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_status'] = ordersStatus;
    data['orders_address'] = ordersAddress;
    data['orders_rating'] = ordersRating;
    data['orders_ratingcomment'] = ordersRatingcomment;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_usersid'] = addressUsersid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}