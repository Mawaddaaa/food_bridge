import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_bridge/controller/donor/quantity_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/data/datasource/remote/address/address_data.dart';
import 'package:food_bridge/data/model/addressmodel.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../../core/services/services.dart';
import '../../linkapi.dart';
import 'home_donor_controller.dart';

abstract class AddItemController extends GetxController
    implements QuantityController {
  @override
  void selectQuantity(int quantity);
  @override
  void clearSelection();
  void pickImage(ImageSource source);
  void submitFoodItem();
  void removeImage(int index);
}

class AddItemControllerImp extends AddItemController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final homeController = Get.find<HomeDonorControllerImp>();
  @override
  var selectedQuantity = Rx<int?>(null);
  var selectedImages = <File>[].obs;
  @override
  var otherQuantity = ''.obs;
  @override
  final List<int> quantities = [1, 2, 3, 4, 5, 6];

  final titleController = TextEditingController();
  final typeController = TextEditingController();
  final descriptionController = TextEditingController();
  final expirationdateController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  AddressData addressData = Get.put(AddressData(Get.find()));
  String? addressid;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> dataaddress = [];

  chooseAddress(String val) {
    addressid = val;
    update();
  }

  getAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.getData(myServices.sharedPrefernces.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  var quantityError = RxString('');
  @override
  bool validateQuantity() {
    if (selectedQuantity.value == null &&
        (otherQuantity.value.isEmpty ||
            int.tryParse(otherQuantity.value) == null)) {
      quantityError.value = "quantityselect".tr;
      return false;
    }
    quantityError.value = '';
    return true;
  }

  RxString imageError = ''.obs;
  bool validateImage() {
    if (selectedImages.isEmpty) {
      imageError.value = "photoselect".tr;
      return false;
    }
    imageError.value = '';
    return true;
  }

  @override
  void pickImage(ImageSource source) async {
    if (selectedImages.length >= 10) {
      Get.snackbar("LimitReached".tr, "photolimit".tr);
      return;
    }

    try {
      if (source == ImageSource.gallery) {
        final pickedFiles = await _picker.pickMultiImage();
        int remainingSlots = 10 - selectedImages.length;
        if (remainingSlots <= 0) return;

        int filesToAdd = pickedFiles.length > remainingSlots
            ? remainingSlots
            : pickedFiles.length;

        for (int i = 0; i < filesToAdd; i++) {
          selectedImages.add(File(pickedFiles[i].path));
        }
        validateImage();
      } else {
        // Camera
        final pickedFile = await _picker.pickImage(source: source);
        if (pickedFile != null) {
          selectedImages.add(File(pickedFile.path));
          validateImage();
        }
      }
    } catch (e) {
      Get.snackbar("Error".tr, "${"failpickphtot".tr}: ${e.toString()}");
    }
  }

  @override
  void removeImage(int index) {
    selectedImages.removeAt(index);
    if (selectedImages.isEmpty) {
      imageError.value = "photoselect".tr;
    }
  }

  @override
  void selectQuantity(int quantity) {
    selectedQuantity.value = quantity;
    otherQuantity.value = '';
  }

  @override
  void clearSelection() {
    selectedQuantity.value = null;
  }

  @override
  void submitFoodItem() async {
    if (formstate.currentState == null || !formstate.currentState!.validate()) {
      return;
    }
    // if (dataaddress.isEmpty) {
    //   return Get.snackbar("Error", "please select the address");
    // }

    try {
      String title = titleController.text.trim();
      String description = descriptionController.text.trim();
      String type = typeController.text.trim();
      String expiry = expirationdateController.text.trim();
      int? quantity =
          selectedQuantity.value ?? int.tryParse(otherQuantity.value);

      MyServices myServices = Get.find();
      String userId = myServices.sharedPrefernces.getString("id")!;

      if (quantity == null || quantity == 0) {
        return;
      }

      if (selectedImages.isEmpty) {
        return;
      }

      // Build request data
      var foodData = {
        'name': title,
        'describtion': description,
        'type': type,
        'quantity': quantity.toString(),
        'id': userId,
        'expiredate': expiry,
        'addressid': addressid ?? '',
      };

      // Prepare request
      var request = http.MultipartRequest('POST', Uri.parse(AppLink.addFood));

      request.fields.addAll(foodData);

      // Add all images
      for (var image in selectedImages) {
        request.files.add(await http.MultipartFile.fromPath(
          'files[]', // Make sure your PHP expects array of files
          image.path,
          filename:
              'food_${DateTime.now().millisecondsSinceEpoch}_${selectedImages.indexOf(image)}.jpg',
        ));
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        if (responseBody.isNotEmpty) {
          try {
            var responseJson = json.decode(responseBody);
            if (responseJson['status'] == 'success') {
              await homeController.refreshData();
              clearForm();
              Get.back(result: true);
            } else {
              print(
                  "Error: ${responseJson['message'] ?? "Failed to add food"}");
            }
          } catch (e) {
            await homeController.refreshData();
            clearForm();
            Get.back(result: true);
          }
        } else {
          await homeController.refreshData();
          clearForm();
          Get.back(result: true);
        }
      } else {
        print("Server Error: Status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error submitting food: ${e.toString()}");
    }
  }

  void clearForm() {
    titleController.clear();
    descriptionController.clear();
    expirationdateController.clear();
    selectedQuantity.value = null;
    selectedImages.clear();
    otherQuantity.value = '';
    update();
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
