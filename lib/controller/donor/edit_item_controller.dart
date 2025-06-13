import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_bridge/controller/donor/quantity_controller.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/address/address_data.dart';
import 'package:food_bridge/data/model/addressmodel.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:food_bridge/linkapi.dart';
import 'package:food_bridge/controller/donor/home_donor_controller.dart';

class EditItemControllerImp extends GetxController
    implements QuantityController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final homeController = Get.find<HomeDonorControllerImp>();

  late TextEditingController titleController;
  late TextEditingController typeController;
  late TextEditingController descriptionController;
  late TextEditingController expirationdateController;

  AddressData addressData = Get.put(AddressData(Get.find()));
  String? addressid;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> dataaddress = [];

  @override
  var selectedQuantity = Rx<int?>(null);
  @override
  var otherQuantity = ''.obs;
  var selectedImages = <File>[].obs;
  var existingImages = <String>[].obs;
  var foodId = ''.obs;
  @override
  var quantityError = RxString('');
  var imageError = RxString('');

  @override
  final List<int> quantities = [1, 2, 3, 4, 5, 6];
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    typeController = TextEditingController();
    descriptionController = TextEditingController();
    expirationdateController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    typeController.dispose();
    descriptionController.dispose();
    expirationdateController.dispose();
    super.onClose();
  }

  void initializeData(Map<String, dynamic> foodData) {
    foodId.value = foodData['food_id'].toString();
    titleController.text = foodData['food_name'] ?? '';
    typeController.text = foodData['food_type'] ?? '';
    descriptionController.text = foodData['food_describtion'] ?? '';
    expirationdateController.text = foodData['food_expiredate'] ?? '';
    addressid = foodData['address_id']?.toString();

    final quantity = foodData['food_quantity'];
    if (quantity != null) {
      if (quantities.contains(quantity)) {
        selectedQuantity.value = quantity;
      } else {
        otherQuantity.value = quantity.toString();
      }
    }

    try {
      if (foodData['food_images'] != null) {
        if (foodData['food_images'] is String) {
          var decoded = jsonDecode(foodData['food_images']);
          existingImages.value = List<String>.from(decoded);
        } else if (foodData['food_images'] is List) {
          existingImages.value = List<String>.from(foodData['food_images']);
        }
      } else {
        existingImages.value = [];
      }
    } catch (e) {
      existingImages.value = [];
    }
    getAddress();
  }

  chooseAddress(String val) {
    addressid = val;
    update();
  }

  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await addressData
          .getData(myServices.sharedPrefernces.getString("id")!);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List listdata = response['data'];
          dataaddress.clear();
          dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
          bool addressExists =
              dataaddress.any((addr) => addr.addressId.toString() == addressid);
          update();
          if (!addressExists && dataaddress.isNotEmpty) {}
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
    }

    update();
  }

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

  void removeImage(int index) {
    selectedImages.removeAt(index);
    validateImage();
  }

  void removeExistingImage(int index) {
    existingImages.removeAt(index);
    validateImage();
  }

  @override
  void selectQuantity(int quantity) {
    selectedQuantity.value = quantity;
    otherQuantity.value = '';
    quantityError.value = '';
  }

  @override
  void clearSelection() {
    selectedQuantity.value = null;
  }

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

  bool validateImage() {
    if (selectedImages.isEmpty && existingImages.isEmpty) {
      imageError.value = "photoselect".tr;
      return false;
    }
    imageError.value = '';
    return true;
  }

  Future<void> updateFoodItem() async {
  if (!formstate.currentState!.validate()) return;
  if (!validateQuantity() || !validateImage()) return;

  statusRequest = StatusRequest.loading;
  update();

  try {
    final request = http.MultipartRequest('POST', Uri.parse(AppLink.editFood));

    request.fields.addAll({
      'name': titleController.text.trim(),
      'describtion': descriptionController.text.trim(),
      'type': typeController.text.trim(),
      'quantity': (selectedQuantity.value ?? int.parse(otherQuantity.value))
          .toString(),
      'id': foodId.value,
      'expiredate': expirationdateController.text.trim(),
      'existing_images': jsonEncode(existingImages),
      'addressid': addressid ?? '',
    });

    // Add new images
    for (final image in selectedImages) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'files[]',
          image.path,
        ),
      );
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    
    // Convert the response to a format that handlingData can process
    var responseData = {
      'status': response.statusCode == 200 ? 'success' : 'failure',
      'data': responseBody.isNotEmpty ? json.decode(responseBody) : null,
    };
    
    statusRequest = handlingData(responseData);
    
    if (statusRequest == StatusRequest.success) {
      if (responseData['data']?['status'] == 'success') {
        final updatedImages = List<String>.from(responseData['data']?['images'] ?? []);
        existingImages.value = updatedImages;
        selectedImages.clear();

        final homeController = Get.find<HomeDonorControllerImp>();
        await homeController.refreshData();
        Get.back(result: true);
      } else {
        throw Exception(responseData['data']?['message'] ?? "failupdate".tr);
      }
    } else {
      throw Exception("${"Servererror".tr}: ${response.statusCode}");
    }
  } catch (e) {
    statusRequest = StatusRequest.serverfailure;
    Get.snackbar("Error".tr, "${"failupdate".tr}: ${e.toString()}");
  } finally {
    update();
  }
}

  void clearForm() {
    titleController.clear();
    typeController.clear();
    descriptionController.clear();
    expirationdateController.clear();
    selectedQuantity.value = null;
    selectedImages.clear();
    existingImages.clear();
    otherQuantity.value = '';
    quantityError.value = '';
    imageError.value = '';
  }
}
