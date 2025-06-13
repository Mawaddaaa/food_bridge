import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_bridge/controller/address/add_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdressController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("AddNewAddress".tr),
      ),
      body: GetBuilder<AddAdressController>(
        builder: (controllerpage) => HandlingDataView(
          statusRequest: controllerpage.statusRequest,
          widget: Column(
            children: [
              if (controllerpage.kMapCenter != null)
                Expanded(
                  child: Stack(
                    children: [
                      FlutterMap(
                        mapController: controllerpage.mapController,
                        options: MapOptions(
                          initialCenter: controllerpage.kMapCenter!,
                          initialZoom: 15,
                          onTap: (tapPosition, latlng) {
                            controllerpage.addMarkers(latlng);
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            userAgentPackageName: 'com.example.food_bridge',
                          ),
                          MarkerLayer(
                            markers: controllerpage.markers.map((latlng) {
                              return Marker(
                                width: 40,
                                height: 40,
                                point: latlng,
                                child: const Icon(Icons.location_pin, color:AppColor.primaryColor, size: 40),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Listener(
                          behavior: HitTestBehavior.opaque, 
                          child: Center(
                            child: MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                controllerpage.goToPageAddDetailsAddress();
                              },
                              color: AppColor.primaryColor,
                              textColor: Colors.white,
                              child:  Text("Continue".tr),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}