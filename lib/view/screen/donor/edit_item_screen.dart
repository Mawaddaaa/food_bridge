import 'package:flutter/material.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/view/widget/donor/addresscard.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:food_bridge/controller/donor/edit_item_controller.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/functions/validinput.dart';
import 'package:food_bridge/linkapi.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:food_bridge/view/widget/donor/custom_quantity_selection_row.dart';
import '../../../controller/donor/add_item_controller.dart';

class EditItemScreen extends StatelessWidget {
  const EditItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditItemControllerImp controller = Get.put(EditItemControllerImp());
    final arguments = Get.arguments as Map<String, dynamic>;
    Get.put(AddItemControllerImp());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initializeData(arguments);
    });

    return Scaffold(
      appBar: AppBar(title: Text("EditItemTitle".tr)),
      body: GetBuilder<EditItemControllerImp>(
        builder:(controller)=> HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("EditItemPhotos".tr),
                        const SizedBox(height: 10),
          
                        // Combined Images Display
                        if (controller.existingImages.isNotEmpty || controller.selectedImages.isNotEmpty)
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.existingImages.length + controller.selectedImages.length,
                              itemBuilder: (context, index) {
                                if (index < controller.existingImages.length) {
                                  // Existing Image
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            "${AppLink.image}/${controller.existingImages[index]}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () => controller.removeExistingImage(index),
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  // New Image
                                  final newIndex = index - controller.existingImages.length;
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.file(
                                            controller.selectedImages[newIndex],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () => controller.removeImage(newIndex),
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
          
                        // Add Button
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.photo_library),
                                      title: Text("EditItemChooseFromGallery".tr),
                                      onTap: () {
                                        controller.pickImage(ImageSource.gallery);
                                        Get.back();
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: Text("TakeaPhoto".tr),
                                      onTap: () {
                                        controller.pickImage(ImageSource.camera);
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffFAEFF3),
                              border: controller.imageError.value.isNotEmpty
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                            ),
                            width: double.infinity,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 40,
                                  color: AppColor.darkGray,
                                ),
                                Text("AddPhotosCount".trParams({
                                  "count": "${controller.selectedImages.length + controller.existingImages.length}"
                                }))
                                ,
                              ],
                            ),
                          ),
                        ),
                        if (controller.imageError.value.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                            child: Text(
                              controller.imageError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    )),
                    const SizedBox(height: 25),
          
                    // Form Fields
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Title".tr),
                        const SizedBox(height: 10),
                        CustomTextFormAuth(
                          labeltext: "Title".tr,
                          type: TextInputType.text,
                          mycontroller: controller.titleController,
                          valid: (val) => validInput(val!, 2, 150, "title"),
                        ),
                        const SizedBox(height: 10),
                        Text("Foodtype".tr),
                        const SizedBox(height: 10),
                        CustomTextFormAuth(
                          labeltext: "Type".tr,
                          type: TextInputType.text,
                          mycontroller: controller.typeController,
                          valid: (val) => validInput(val!, 2, 150, "type"),
                        ),
                        const SizedBox(height: 10),
                        Text("Description".tr),
                        const SizedBox(height: 10),
                        CustomTextFormAuth(
                          labeltext: "Description".tr,
                          type: TextInputType.text,
                          mycontroller: controller.descriptionController,
                          valid: (val) => validInput(val!, 2, 200, "description"),
                        ),
                        const SizedBox(height: 15),
                        Text("Quantity".tr),
                        const SizedBox(height: 10),
                        QuantitySelector(controller: controller),
                        const SizedBox(height: 10),
                        Text("ExpiredDate".tr),
                        const SizedBox(height: 15),
                        CustomTextFormAuth(
                          labeltext: "SelectDate".tr,
                          type: TextInputType.datetime,
                          mycontroller: controller.expirationdateController,
                          iconData: Icons.calendar_month_outlined,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
                              controller.expirationdateController.text = formattedDate;
                            }
                          },
                          valid: (val) => validInput(val!, 2, 150, "expirydate"),
                        ),
                        const SizedBox(height: 20),
                    Text("Select Address".tr),
                    const SizedBox(height: 10),
                    GetBuilder<EditItemControllerImp>(
                      builder: (controller) {
                        if (controller.dataaddress.isEmpty) {
                          InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.addressadd);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Light background
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.grey, // Light border
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 48,
                            color: AppColor.primaryColor, 
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "NoAddressAdded".tr,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${"addaddresstocontinue".tr}\n${"Taptoadd".tr}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Icon(
                            Icons.add_circle_outline,
                            color: AppColor.primaryColor,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  );
                        }
                        return Column(
                          children: List.generate(
                            controller.dataaddress.length,
                            (index) => InkWell(
                              onTap: () {
                                controller.chooseAddress(
                                  controller.dataaddress[index].addressId!
                                );
                              },
                              child: AddressCard(
                                title: "${controller.dataaddress[index].addressName}",
                                body: "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                isactive: controller.addressid == controller.dataaddress[index].addressId
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (controller.formstate.currentState!.validate() &&
                              controller.validateQuantity() &&
                              controller.validateImage()) {
                            controller.updateFoodItem();
                          }
                        },
                        backgroundColor: AppColor.primaryColor,
                        child: Text(
                          "Update".tr,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}