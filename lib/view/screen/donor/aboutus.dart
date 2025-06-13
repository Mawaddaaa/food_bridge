import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/color.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_image_asset.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "AppBarTitle".tr
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 55,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(AppImageAsset.logo2 ),
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "AboutUsTitle".tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "AboutUsSubtitle".tr,
                style: const TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                "Passage1".tr,
                style: const TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Passage2".tr,
                style: const TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                  "Passage3".tr,
                style: const TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Passage4".tr,
                style: const TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Passage5".tr,
                style: const TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Passage6".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
