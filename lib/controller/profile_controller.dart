import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/functions/handlingdatacontroller.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:food_bridge/data/datasource/remote/profile_data.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ProfileController extends GetxController {
  ProfileData profileData = ProfileData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;
  late TextEditingController username;
  late TextEditingController phone;
  File? imageFile;
  Map<String, dynamic> data = {};

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();
    
    var response = await profileData.getData(
        myServices.sharedPrefernces.getString("id")!);
        
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'] is List && response['data'].isNotEmpty) {
          data = response['data'][0]; 
          username.text = data['users_name'] ?? '';
          phone.text = data['users_phone'] ?? '';
          
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
      statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future<void> updateProfile() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var uri = Uri.parse(AppLink.editprofile);
      var request = http.MultipartRequest('POST', uri);
      request.fields['userid'] = myServices.sharedPrefernces.getString("id")!;
      request.fields['name'] = username.text;
      request.fields['phone'] = phone.text;

      if (imageFile != null) {
        var stream = http.ByteStream(imageFile!.openRead());
        var length = await imageFile!.length();
        var multipartFile = http.MultipartFile(
          'image',
          stream,
          length,
          filename: basename(imageFile!.path),
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      // طباعة الرد الخام من السيرفر
      print('Raw Server Response: $responseBody');

      var result = jsonDecode(responseBody);

      if (result['status'] == 'success') {
        Get.snackbar('Success', 'Profile updated successfully');
        await getData();
      } else {
        Get.snackbar('Error', result['message'] ?? 'Failed to update profile');
      }
    } on FormatException catch (e) {
      Get.snackbar('Error', 'Invalid server response format');
      print('FormatException: $e');
    } catch (e) {
      Get.snackbar('Error', 'Error: ${e.toString()}');
    } finally {
      statusRequest = StatusRequest.none;
      update();
    }
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
