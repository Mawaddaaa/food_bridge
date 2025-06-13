class AppLink {
  static const String server = "https://foodbridge600.com/foodbridge";

// images
  static const String image = "$server/upload";

// users
  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";
// Auth------
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodesignup = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

// forgetpassword
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

// home
  static const String homeDonor = "$server/home_donor.php";
  static const String homeReciever = "$server/home_reciever.php";

// food
  static const String addFood = "$server/food/add.php";
  static const String deleteFood = "$server/food/delete.php";
  static const String editFood = "$server/food/edit.php";
  static const String searchFood = "$server/food/search.php";
  static const String filterFood = "$server/food/filter.php";
  static const String remainingtime = "$server/food/get_remaining_time.php";
  static const String foodupdated = "$server/food/food_updated.php";
// address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

// chats
  static const String sendMessage = "$server/send_message.php";
  static const String fetchMessage = "$server/fetch_messages.php";
  static const String searchUsers = "$server/search_users.php";
  static const String fetchConversations = "$server/fetch_conversations.php";
  static const String viewUsers = "$server/view_users.php";

// cart
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartview = "$server/cart/view.php";
  static const String fooditemscount = "$server/cart/getcount.php";

  // profile
  static const String viewprofile = "$server/profile/view.php";
  static const String editprofile = "$server/profile/edit.php";

  // orders
  static const String reserve = "$server/orders/reserve.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String deleteorders = "$server/orders/delete.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String rating = "$server/orders/rating.php";
  static const String doneorders = "$server/orders/done.php";

  // admin
  static const String foodrequests = "$server/admin/food/requests.php";
  static const String adminhome = "$server/admin/home.php";
  static const String foodrequestapprove = "$server/admin/food/approve.php";
  static const String foodrequestdismiss = "$server/admin/food/dismiss.php";
  static const String foodstatussummary =
      "$server/admin/analysis/food_status_count.php";
  static const String ordersratingsummary =
      "$server/admin/analysis/orders_rating_summary.php";
}
