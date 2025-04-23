import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/address/add.dart';
import 'package:ecommercecourse/view/address/adddetails.dart';
import 'package:ecommercecourse/view/address/view.dart';
import 'package:ecommercecourse/view/screen/HomeScreen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/screen/checkout.dart';
import 'package:ecommercecourse/view/screen/detailesscreen.dart';
import 'package:ecommercecourse/view/screen/items.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';
import 'package:ecommercecourse/view/screen/offers.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/order/archive.dart';
import 'package:ecommercecourse/view/screen/order/orderdetailes.dart';
import 'package:ecommercecourse/view/screen/order/pending.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.cart,
    page: () => const Cart(),
  ),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoute.detailesscreen,
    page: () => const Detailesscreen(),
  ),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.items, page: () => const Itemsscreen()),
  GetPage(name: AppRoute.myfavorite, page: () => const Myfavorite()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressaddDetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.pending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.orderdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.offer, page: () => const Offersview()),
  // GetPage(name: AppRoute.pending, page: ()=>OrdersPending())
];
