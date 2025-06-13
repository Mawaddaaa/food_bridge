import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_bridge/controller/receiver/orders_details_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("OrdersDetails".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder:(controller)=> HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Table(
                        children:  [
                           TableRow(children: [
                             Text(
                              "Item".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                             Text("Quantity".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ]),
                          ...List.generate(controller.data.length, (index)=>
                          TableRow(children: [
                            Text("${controller.data[index].foodName}", textAlign: TextAlign.center),
                            Text("${controller.data[index].countitems}", textAlign: TextAlign.center),
                          ]),)
                        ],
                      ),
                    ),
                  ),

                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Address".tr, style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColor.primaryColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(
                              controller.ordersModel.addressLat ?? 0.0,
                              controller.ordersModel.addressLong ?? 0.0,
                            ),
                            initialZoom: 15.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.food_bridge',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: 40.0,
                                  height: 40.0,
                                  point: LatLng(
                                    controller.ordersModel.addressLat ?? 0.0,
                                    controller.ordersModel.addressLong ?? 0.0,
                                  ),
                                  child: const Icon(Icons.location_pin, color: AppColor.primaryColor, size: 40),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}