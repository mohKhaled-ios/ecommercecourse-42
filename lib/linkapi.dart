class AppLink {
  static const String server = "http://192.168.1.2/ecommercecourse-PHP--33";
//
  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";

  static const String imagestatic = "$server/upload";
  static const String imagescategories = "$imagestatic/categories";
  static const String imagesitems = "$imagestatic/items";
  //////items page
  static const String items = "$server/itemes/itemes.php";
  static const String addfavorite = "$server/favorite/add.php";
  static const String removefavorite = "$server/favorite/remove.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String verfiycode = "$server/auth/verfiycode.php";
  static const String login = "$server/auth/login.php";

  //verfiycode

  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetepassword =
      "$server/forgetpassword/resetepassword.php";

  static const String verifycodeforgetpasswors =
      "$server/forgetpassword/verfiycode.php";

//home

  static const String homepage = "$server/home.php";
  static const String favoriteview = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetecountitems = "$server/cart/getcountitems.php";
  static const String searchitems = "$server/itemes/search.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressView = "$server/address/view.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  static const String checkout = "$server/orders/checkout.php";
  static const String pending = "$server/orders/pending.php";

  //========================archive
  static const String archive = "$server/orders/archive.php";
  static const String offer = "$server/offer.php";
  static const String rating = "$server/rating.php";
}
