import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomReclist extends StatelessWidget {
  final String name;
  final String username;
  final String type;
  final String quantity;
  final String image;
  final String description;
  final String expireDate;
  final List<String>? images;
  final void Function() onreserve;

  const CustomReclist({
    super.key,
    required this.name,
    required this.type,
    required this.quantity,
    required this.image,
    required this.expireDate,
    required this.onreserve,
    this.images,
    required this.description,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = images != null && images!.isNotEmpty
        ? images!
        : (image.isNotEmpty ? [image] : []);

    return Padding(
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
              width: 100,
              child: Column(
                children: [
                  if (imageList.isNotEmpty)
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        imageList.first.startsWith("http")
                            ? imageList.first
                            : "${AppLink.image}/${imageList.first}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (imageList.length > 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "+${imageList.length - 1} more",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'Donor'.tr}: ${username.isNotEmpty ? username : 'Unknown'.tr}',
                  ),
                  Text("DetailsTitle".trParams({"name": name})),
                  Text("DetailsType".trParams({"type": type})),
                  Text("DetailsDescription".trParams({"description": description})),
                  Text("DetailsQuantity".trParams({"quantity": quantity})),
                  Text("DetailsExpireDate".trParams({"date": expireDate})),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 37,
                      child: FloatingActionButton(
                        heroTag: "customButton_${name}_$image",
                        onPressed: onreserve,
                        backgroundColor: AppColor.primaryColor,
                        child:  Text(
                          "RecBodybuttonlist".tr,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
