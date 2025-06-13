import 'package:flutter/cupertino.dart';
import 'package:food_bridge/core/class/statusrequest.dart';
import 'package:food_bridge/core/services/services.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/food/search.dart';
import '../../data/model/foodmodel.dart';
import '../receiver/home_reciever_controller.dart';

abstract class SearchFoodController extends GetxController {
  initialData();
  searchFood(String search);
  onSearchChanged(String query);
  goToPageFoodDetails(FoodModel foodModel);
}


class SearchFoodControllerImp extends GetxController implements SearchFoodController {
  final MyServices myServices = Get.find();
  final SearchFoodData searchFoodData = SearchFoodData(Get.find());
  final HomeRecieverControllerImp homeController = Get.find();

  String? username;
  String? id;
  List<dynamic> searchFoodList = []; 
  List<FoodModel> searchResults = [];
  final TextEditingController searchController = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void initialData() {
    username = myServices.sharedPrefernces.getString("username");
    id = myServices.sharedPrefernces.getString("id")!;
  }

  @override
  void onInit() {
    initialData();
    searchController.addListener(_onSearchChanged);
    super.onInit();
  }

  void _onSearchChanged() {
    if (searchController.text.isEmpty) {
      _resetSearch();
    }
  }

  void _resetSearch() {
    searchResults = [];
    searchFoodList = [];
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onClose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.onClose();
  }

  @override
  void onSearchChanged(String query) {
    if (query.length > 2) {
      searchFood(query);
    } else if (query.isEmpty) {
      _resetSearch();
    }
  }


  Map<String, dynamic> _mergeWithHomeData(Map<String, dynamic> searchItem) {
    try {
      final homeItem = homeController.food.firstWhere(
            (item) => item['food_id'] == searchItem['food_id'],
        orElse: () => null,
      );

      if (homeItem != null) {
        return {
          ...searchItem, 
          'address_lat': homeItem['address_lat'],
          'address_long': homeItem['address_long'],
          'address_name': homeItem['address_name'],
          'address_city': homeItem['address_city'],
          'address_street': homeItem['address_street'],
        };
      }
      return searchItem;
    } catch (e) {
      print('Merge error: $e');
      return searchItem;
    }
  }


  @override
  Future<void> searchFood(String search) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      final response = await searchFoodData.searchData(search);

      if (response['status'] == 'success') {
        searchFoodList = response['data'];

        searchResults = searchFoodList.map((item) {
          final mergedData = _mergeWithHomeData(item);
          print('Merged Item: $mergedData'); 
          return FoodModel.fromJson(mergedData);
        }).toList();

        statusRequest = StatusRequest.success;
      } else {
        _resetSearch();
        Get.snackbar("Error".tr, "Noresultsfound".tr);
      }
    } catch (e) {
      _resetSearch();
      Get.snackbar("Error".tr, "${"Searchfailed".tr}: ${e.toString()}");
    }

    update();
  }


   @override
  goToPageFoodDetails(foodModel) {
    Get.toNamed(AppRoute.foodDetailsReciever,
        arguments: {"foodmodel": foodModel});
  }


}