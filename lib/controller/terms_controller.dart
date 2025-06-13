import 'package:get/get.dart';

class TermsController extends GetxController {
  var isChecked = false.obs;
  var showError = false.obs;

  String? validateCheckbox() {
    if (!isChecked.value) {
      showError.value = true;
      return "ShouldAgreeAlert".tr;
    }
    showError.value = false;
    return null;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
    showError.value = false;
  }

  void acceptTerms() {
    isChecked.value = true;
    Get.back();
  }
}