import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;

  const AddressCard(
      {super.key,
      required this.title,
      required this.body,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive ? AppColor.secondaryColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isactive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          body,
          style: TextStyle(
              color: isactive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
