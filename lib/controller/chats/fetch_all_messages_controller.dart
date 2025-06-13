import 'package:get/get.dart';
import 'package:food_bridge/core/class/crud.dart';
import 'package:food_bridge/data/datasource/remote/chats/chats_data.dart';
import '../../core/services/services.dart';
import '../../data/model/chats_model.dart';

class FetchAllMessagesController extends GetxController {
  final ChatData chatData = ChatData(Crud());
  MyServices myServices = Get.find();
  var chats = <Chat>[].obs; // Reactive list of chats

  var isLoading = false.obs; // Loading state
  var hasError = false.obs; // Error state
  String errorMessage = ''; // Error message


  @override
  void onInit() {
    fetchAllChats(); // Fetch chats when the controller is initialized
    super.onInit();
  }

  // Fetch all chats
  Future<void> fetchAllChats() async {
    final userid = myServices.sharedPrefernces.getString("id") ?? '0';    try {
      isLoading(true);
      hasError(false);
      errorMessage = '';


      // Use the getAllChats method from ChatData
      final List<Chat> fetchedChats = await chatData.getAllChats(userid);
      chats.value = fetchedChats;
    } catch (e) {
      hasError(true);
      errorMessage = e.toString();
      Get.snackbar('Error'.tr, errorMessage);
    } finally {
      isLoading(false);
    }
  }
}