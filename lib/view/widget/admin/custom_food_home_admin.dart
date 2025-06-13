import 'package:flutter/material.dart';
import 'package:food_bridge/controller/admin/home_admin_controller.dart';
import 'package:get/get.dart';
import '../../../linkapi.dart';

class CustomFoodHomeAdmin extends StatelessWidget {
  final String name;
  final String type;
  final String username;
  final String quantity;
  final String image;
  final String description;
  final String expiredate;
  final String id;
  final List<String>? images;

  const CustomFoodHomeAdmin({
    super.key,
    required this.name,
    required this.type,
    required this.quantity,
    required this.image,
    required this.expiredate,
    required this.id,
    required this.description,
    this.images,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = images ?? [image];

    return GetBuilder<HomeAdminControllerImp>(
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
                        height: 80,
                        width: 80,
                        child: Image.network(
                          "${AppLink.image}/${imageList.first}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (imageList.length > 1)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "+ ${imageList.length - 1} ${'moreImages'.tr}"
                          ,
                            style: const TextStyle(fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
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