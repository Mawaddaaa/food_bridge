import 'dart:async';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/reciever/orders_details_data.dart';
import 'package:food_bridge/data/model/cartmodel.dart';
import 'package:food_bridge/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  Completer<GoogleMapController>? completecontroller;

  CameraPosition? cameraPosition;
  List<Marker> markers = [];

  double? lat;
  double? long;

  // initialData() {
  //   cameraPosition =
  //        CameraPosition(target: LatLng(ordersModel.addressLat!,ordersModel.addressLong!)
  //        , zoom: 12.4746);
  //        markers.add(Marker(markerId: const MarkerId("1"),
  //        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
  // }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    // initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersModel.ordersId!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
