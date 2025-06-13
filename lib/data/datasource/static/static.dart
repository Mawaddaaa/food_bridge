import 'package:food_bridge/core/constant/app_image_asset.dart';
import 'package:food_bridge/data/model/onboardingmodel.dart';
import 'package:get/get.dart';

List<Onboardingmodel> onBoardingList = [
  Onboardingmodel(
    title: "title1".tr,
    body: "subtitle1".tr,
    image: AppImageAsset.onBoardingImageOne
  ),
  Onboardingmodel(
    title: "title2".tr,
    body: "subtitle2".tr,
    image: AppImageAsset.onBoardingImageTwo
  ),
  Onboardingmodel(
    title: "title3".tr,
    body: "subtitle3".tr,
    image: AppImageAsset.onBoardingImageThree
  )
];
