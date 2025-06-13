import 'package:flutter/material.dart';
import 'package:food_bridge/controller/address/add_address_details_controller.dart';
import 'package:food_bridge/core/shared/custombutton.dart';
import 'package:food_bridge/view/widget/auth/customtextformauth.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validinput.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("AddAddressDetails".tr),
        ),
        body: Container(
          padding: const EdgeInsets.all(26),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) =>
               Form(
                 key: controller.formstate,
                 child: ListView(
                  children: [
                    CustomTextFormAuth(
                        labeltext: "City".tr,
                        type: TextInputType.text,
                        mycontroller: controller.city,
                      valid: (val) {
                        return validInput(val!, 5, 30, "city");
                      },),
                        const SizedBox(height: 10,),
                    CustomTextFormAuth(
                        labeltext: "Street".tr,
                        type: TextInputType.streetAddress,
                        mycontroller: controller.street,
                      valid: (val) {
                        return validInput(val!, 5, 30, "street");
                      },),
                        const SizedBox(height: 10,),
                    CustomTextFormAuth(
                        labeltext: "Name".tr,
                        type: TextInputType.name,
                        mycontroller: controller.name,
                      valid: (val) {
                        return validInput(val!, 5, 30, "name");
                      },),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 58,
                      child: CustomButton(
                        text: 'Add'.tr,
                        onPressed: () async {
                          if (controller.formstate.currentState!.validate()) {
                            await controller.addAddress();

                            final args = Get.arguments;
                            Get.back(result: {
                              'lat': args['lat'],
                              'lng': args['lng'],
                              'city': controller.city.text,
                              'street': controller.street.text,
                              'name': controller.name.text,
                            });
                          }
                        },
                      ),
                    ),

                  ],
                               ),
               ),
            ),
          ),
        );
  }
}
