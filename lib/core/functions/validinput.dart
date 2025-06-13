import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "RegisterNameValidate".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "RegisterEmailValidate".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "RegisterPhoneValidate".tr;
    }
  }


  if (type == "title") {
    if (val.isEmpty) {
      return "foodTitleValidation".tr;
    }
  }
  if (type == "type") {
    if (val.isEmpty) {
      return "foodTypeValidation".tr;
    }
  }
  if (type == "description") {
    if (val.isEmpty) {
      return "descriptionValidation".tr;
    }
  }
  if (type == "expirydate") {
    if (val.isEmpty) {
      return "expiryDateValidation".tr;
    }
  }
  if (type == "city") {
    if (val.isEmpty) {
      return "cityValidation".tr;
    }
  }
  if (type == "street") {
    if (val.isEmpty) {
      return "streetValidation".tr;
    }
  }
  if (type == "name") {
    if (val.isEmpty) {
      return "NameValidation".tr;
    }
  }

  if (val.isEmpty) {
    return "RegisterEmptyValidate".tr;
  }

  if (val.length < min) {
    return 'RegisterLimitValidateMin'.tr.replaceAll('{min}', min.toString());
  }

  if (val.length > max) {
    return 'RegisterLimitValidateMax'.tr.replaceAll('{max}', max.toString());
  }


}


