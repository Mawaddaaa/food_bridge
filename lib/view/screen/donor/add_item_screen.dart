import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/view/widget/donor/addresscard.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../controller/donor/add_item_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/donor/custom_quantity_selection_row.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("addItemTitle".tr),
      ),
      body: GetBuilder<AddItemControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formstate,
              child: Column(
                children: [
                  // Image Picker with Validation
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("addItemPhotos".tr),
                          const SizedBox(height: 10),

                          // Selected Images Grid
                          if (controller.selectedImages.isNotEmpty)
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.selectedImages.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            controller.selectedImages[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.removeImage(index),
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                },
                              ),
                            ),

                          // Add Image Button
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
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title:
                                            Text("addItemChooseFromGallery".tr),
                                        onTap: () {
                                          controller
                                              .pickImage(ImageSource.gallery);
                                          Get.back();
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.camera_alt),
                                        title: Text("TakeaPhoto".tr),
                                        onTap: () {
                                          controller
                                              .pickImage(ImageSource.camera);
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
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 40,
                                    color: AppColor.darkGray,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "AddPhotos".tr,
                                    style: TextStyle(color: AppColor.darkGray),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.imageError.value.isNotEmpty)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 12.0),
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
                  const SizedBox(height: 20),

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
                            String formattedDate =
                                DateFormat("yyyy-MM-dd").format(pickedDate);
                            controller.expirationdateController.text =
                                formattedDate;
                          }
                        },
                        valid: (val) => validInput(val!, 2, 150, "expirydate"),
                      ),
                    ],
                  ),
                  if (controller.dataaddress.isEmpty)
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
                  ),
                  const SizedBox(height: 25),
                  ...List.generate(
                      controller.dataaddress.length,
                      (index) => InkWell(
                            onTap: () {
                              controller.chooseAddress(
                                  controller.dataaddress[index].addressId!);
                            },
                            child: AddressCard(
                                title:
                                    "${controller.dataaddress[index].addressName}",
                                body:
                                    "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                isactive: controller.addressid ==
                                        controller.dataaddress[index].addressId
                                    ? true
                                    : false),
                          )),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (controller.formstate.currentState!.validate() &&
                            controller.validateQuantity() &&
                            controller.validateImage()) {
                          controller.submitFoodItem();
                        }
                      },
                      backgroundColor: AppColor.primaryColor,
                      child: Text(
                        "Submit".tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
