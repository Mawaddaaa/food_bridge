import 'package:flutter/material.dart';
import 'package:food_bridge/core/constant/app_image_asset.dart';

class LogoVerification extends StatelessWidget {
  const LogoVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(AppImageAsset.passwordlogo),
      height: 127.0,
      width: 137.0,
    );
  }
}
