import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/addressdata.dart';
import 'package:ecommercecourse/data/datasource/remote/checkout_data.dart';
import 'package:ecommercecourse/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  late String couponid;
  late String priceorder;
  late String discountcoupon;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar('error', 'please select payment method');
    if (deliveryType == null)
      return Get.snackbar('error', 'please select delivery type');
    if (dataaddress.isEmpty) {
      return Get.snackbar('error', 'please select sddress shipping');
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString('id'),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "20",
      "ordersprice": priceorder,
      "couponid": couponid,
      "coupondiscount": discountcoupon.toString(),
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar('succcesss', "the order was successsssss");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar('خطاء', "please try again");
      }
      // End
    }
    update();
  }

  // ////"usersid":,
  //      "addressid":,
  //       "orderstype":,
  //        "pricedelivery":,
  //         "ordersprice":,
  //          "couponid":,
  //           "paymentmethod":,

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    discountcoupon = Get.arguments['coupondiscount'].toString();
    getShippingAddress();
    super.onInit();
  }
}
