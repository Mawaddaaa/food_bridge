import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/app_image_asset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(AppImageAsset.logo),
      height: 120.0,
      width: 120.0,
    );
  }
}
