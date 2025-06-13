import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/food_requests_controller.dart';
import 'package:food_bridge/view/widget/donor/custom_donor_button.dart';
import 'package:get/get.dart';
import '../../../linkapi.dart';

class CustomFoodRequest extends StatelessWidget {
  final String name;
  final String type;
  final String quantity;
  final String image;
  final String description;
  final String expiredate;
  final String id;
  final List<String>? images;
  final String usersid;
  final String username;

  const CustomFoodRequest({
    super.key,
    required this.name,
    required this.type,
    required this.quantity,
    required this.image,
    required this.expiredate,
    required this.id,
    required this.description,
    this.images, required this.usersid,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = images ?? [image];

    return GetBuilder<FoodRequestsControllerImp>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffFAEFF3),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.white60,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    if (imageList.isNotEmpty)
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.network(
                          "${AppLink.image}/${imageList.first}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (imageList.length > 1)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                            "+ ${imageList.length - 1} ${'moreImages'.tr}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${'Donor'.tr}: ${username.isNotEmpty ? username : 'Unknown'.tr}',
                    ),
                    Text("DetailsTitle".trParams({"name": name})),
                    Text("DetailsType".trParams({"type": type})),
                    Text("DetailsDescription".trParams({"description": description})),
                    Text("DetailsQuantity".trParams({"quantity": quantity})),
                    Text("DetailsExpireDate".trParams({"date": expiredate})),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        CustomDonorButton(
                          onPressed: () {
                            controller.approveFood(id,usersid);
                          },
                          text: "Approve".tr,
                          id: id,
                        ),
                        const SizedBox(width:10,),
                        CustomDonorButton(
                          onPressed: () {
                            controller.dismissFood(id,usersid);
                          },
                          text: "Dismiss".tr,
                          id: id,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
