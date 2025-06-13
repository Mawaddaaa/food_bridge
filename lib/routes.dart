import 'package:food_bridge/core/constant/routes.dart';
import 'package:food_bridge/core/middleware/mymiddleware.dart';
import 'package:food_bridge/view/screen/address/donor/add.dart';
import 'package:food_bridge/view/screen/address/donor/add_address_details.dart';
import 'package:food_bridge/view/screen/address/donor/view.dart';
import 'package:food_bridge/view/screen/admin/admin_home_screen.dart';
import 'package:food_bridge/view/screen/admin/analysis_screen.dart';
import 'package:food_bridge/view/screen/admin/food_details_admin.dart';
import 'package:food_bridge/view/screen/admin/food_request.dart';
import 'package:food_bridge/view/screen/admin/language_settings_admin.dart';
import 'package:food_bridge/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:food_bridge/view/screen/auth/login.dart';
import 'package:food_bridge/view/screen/auth/forgetpassword/reset_password.dart';
import 'package:food_bridge/view/screen/auth/signup.dart';
import 'package:food_bridge/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:food_bridge/view/screen/auth/success_signup.dart';
import 'package:food_bridge/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:food_bridge/view/screen/auth/verifycodesignup.dart';
import 'package:food_bridge/view/screen/donor/aboutus.dart';
import 'package:food_bridge/view/screen/donor/add_item_screen.dart';
import 'package:food_bridge/view/screen/donor/donor_home_screen.dart';
import 'package:food_bridge/view/screen/donor/edit_item_screen.dart';
import 'package:food_bridge/view/screen/donor/food_details.dart';
import 'package:food_bridge/view/screen/donor/goals_screen.dart';
import 'package:food_bridge/view/screen/donor/maps_screen.dart';
import 'package:food_bridge/view/screen/donor/notifications_screen.dart';
import 'package:food_bridge/view/screen/receiver/language_setting_reciever.dart';
import 'package:food_bridge/view/screen/receiver/orders_archive.dart';
import 'package:food_bridge/view/screen/receiver/orders_details.dart';
import 'package:food_bridge/view/screen/receiver/receiver_home_screen.dart';
import 'package:food_bridge/view/screen/receiver/search_screen.dart';
import 'package:food_bridge/view/screen/donor/settings_screen_donor.dart';
import 'package:food_bridge/view/screen/language.dart';
import 'package:food_bridge/view/screen/donor/languagesettingsdonor.dart';
import 'package:food_bridge/view/screen/onboarding.dart';
import 'package:food_bridge/view/screen/profile.dart';
import 'package:food_bridge/view/screen/receiver/cart.dart';
import 'package:food_bridge/view/screen/receiver/food_details_reciever.dart';
import 'package:food_bridge/view/screen/receiver/orders.dart';
import 'package:food_bridge/view/screen/receiver/setting_screen_reciever.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: ()=>const Language() ,  middlewares: [MyMiddleware()]),

   GetPage(name: AppRoute.langaugeSettingsdonor, page: ()=> const LanguageSettingsDonor() ),
   GetPage(name: AppRoute.languageSettingReciever, page: ()=> const LanguageSettingReciever() ),
   
  // GetPage(name: "/", page: ()=>const TestView() ),
  // auth
  GetPage(name: AppRoute.onBoarding, page: ()=>const Onboarding() ),
  GetPage(name: AppRoute.login, page: ()=>const Login() ),
  GetPage(name: AppRoute.signUp, page: ()=>const SignUp() ),
  GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword() ),
  GetPage(name: AppRoute.verifyCode, page: ()=>const VerifyCode() ),
  GetPage(name: AppRoute.resetPassword, page: ()=>const ResetPassword() ),
  GetPage(name: AppRoute.successResetPassword, page: ()=>const SuccessResetPassword() ),
  GetPage(name: AppRoute.sucessSignUp, page: ()=>const SuccessSignUp() ),
  GetPage(name: AppRoute.sucessSignUp, page: ()=>const SuccessSignUp() ),
  // onBoarding
  GetPage(name: AppRoute.verifyCodeSignUp, page: ()=>const VerifyCodeSignUp() ),
  GetPage(name: AppRoute.searchScreen, page: ()=>  SearchScreen() ),
  GetPage(name: AppRoute.notificationsScreen, page: ()=>const NotificationsScreen() ),
  // Home
   GetPage(name: AppRoute.homedonorpage, page: ()=> DonorHomescreen() ),
   GetPage(name: AppRoute.homerecieverpage, page: ()=> ReceiverHomescreen() ),

   GetPage(name: AppRoute.additemScreen, page: ()=> const AddItemScreen() ),
   GetPage(name: AppRoute.mapsScreen, page: ()=> const MapsScreen() ),
   GetPage(name: AppRoute.goalsScreen, page: ()=> const GoalsScreen() ),
   GetPage(name: AppRoute.settingsScreenDonor, page: ()=> const SettingsScreenDonor() ),
   GetPage(name: AppRoute.settingScreenReciever, page: ()=> const SettingScreenReciever() ),
   
   GetPage(name: AppRoute.foodDetails, page: ()=> const FoodDetails() ),
   GetPage(name: AppRoute.foodDetailsReciever, page: ()=> const FoodDetailsReciever() ),
   GetPage(name: AppRoute.foodcart, page: ()=> const Cart() ),
   GetPage(name: AppRoute.editItemScreen, page: ()=> const EditItemScreen() ),
  //  address
  GetPage(name: AppRoute.addressview, page: ()=> const AddressView() ),
  GetPage(name: AppRoute.addressadd, page: ()=> const AddressAdd() ),
  GetPage(name: AppRoute.addressadddetails, page: ()=> const AddAddressDetails() ),

  // about us
  GetPage(name: AppRoute.aboutus, page: ()=> const AboutUs() ),

  GetPage(name: AppRoute.profile, page: ()=> const Profile() ),

  // orders
  GetPage(name: AppRoute.pendingorders, page: ()=> const PendingOrders() ),
  GetPage(name: AppRoute.ordersdetails, page: ()=> const OrdersDetails() ),
  GetPage(name: AppRoute.ordersarchive, page: ()=> const OrdersArchive() ),

  // admin
  GetPage(name: AppRoute.adminhome, page: ()=>  AdminHomeScreen() ),
  GetPage(name: AppRoute.languagesettingsadmin, page: ()=>  const LanguageSettingsAdmin() ),
  GetPage(name: AppRoute.foodDetailsAdmin, page: ()=>  const FoodDetailsAdmin() ),
  GetPage(name: AppRoute.foodRequest, page: ()=>  const FoodRequest() ),
  GetPage(name: AppRoute.analysisScreen, page: ()=>   AnalysisScreen() ),
  
  
];



