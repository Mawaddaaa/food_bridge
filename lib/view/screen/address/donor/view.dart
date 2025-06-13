import 'package:flutter/material.dart';
import 'package:food_bridge/controller/address/view_controller.dart';
import 'package:food_bridge/core/class/handlingdataview.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          title:  Text("Address".tr),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addressadd);
          },
          child: const Icon(Icons.add , color: Colors.white,),
        ),
        body: GetBuilder<AddressViewController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return CardAddress(
                          addressModel: controller.data[i],
                          onDelete: () {
                            controller.deleteAddress(controller.data[i].addressId!);
                          },
                        );
                      }),
                )));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 20,left: 20, bottom: 0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName! , style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(
                "${addressModel.addressCity!} ${addressModel.addressStreet}"),
            trailing: IconButton(
                onPressed: onDelete, icon: const Icon(Icons.delete_outline, color: AppColor.secondaryColor,)),
          ),
        ),
      ),
    );
  }
}
