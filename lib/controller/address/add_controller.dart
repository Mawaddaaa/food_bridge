import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class AddAdressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  List<LatLng> markers = [];

  double? lat;
  double? long;

  late final MapController mapController = MapController();

  void addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(latLng);
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  void goToPageAddDetailsAddress() {
  if (lat == null || long == null) {
    Get.snackbar("Error", "Please select a location on the map");
    return;
  }
  Get.toNamed(AppRoute.addressadddetails, arguments: {
    "lat": lat.toString(),
    "long": long.toString(),
  });
  }

  Position? position;
  LatLng? kMapCenter;

  Future<void> getCurrentLocation() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        statusRequest = StatusRequest.failure;
        update();
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();
    kMapCenter = LatLng(position!.latitude, position!.longitude);
    addMarkers(kMapCenter!);
    statusRequest = StatusRequest.none;
    update();
  } catch (e) {
    statusRequest = StatusRequest.serverfailure;
    update();
  }
}

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
