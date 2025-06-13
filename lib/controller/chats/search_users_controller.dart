import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/services/services.dart';
import '../../core/class/crud.dart';
import '../../data/datasource/remote/chats/chats_data.dart';
import '../../data/model/user_search_model.dart';

class SearchUserController extends GetxController {
  final ChatData _chatData = ChatData(Crud());
  final MyServices _myServices = Get.find();

  var users = <UserSearchModel>[].obs;
  var statusRequest = StatusRequest.none.obs;
  var searchController = TextEditingController();
  var searchText = ''.obs;
  var currentUserId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    currentUserId.value = _myServices.sharedPrefernces.getString("id") ?? '';
  }

  // Updated to use currentUserId from the controller state
  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      clearSearchResults();
      return;
    }

    if (query.length < 2) {
      Get.snackbar(
        "Notice".tr,
        "chatssearchnotic".tr,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    statusRequest.value = StatusRequest.loading;

    try {
      final results = await _chatData.searchUsers(
        query: query,
        currentUserId: currentUserId.value,
      );

      users.assignAll(results);
      statusRequest.value = StatusRequest.success;
    } catch (e) {
      statusRequest.value = StatusRequest.serverfailure;
      Get.snackbar(
        "Error".tr,
        "${'failedsearch'.tr}: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint("Search error: $e");
    }
  }

  void clearSearchResults() {
    users.clear();
    statusRequest.value = StatusRequest.none;
    searchController.clear();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
