import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cartdata.dart';
import 'package:ecommercecourse/data/model/cartmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/model/checkcouponmodel.dart';

class Cartcontroller extends GetxController {
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  CheckcoponModel? checkcoponModel;
  CartData cartData = CartData(Get.find());
  double priceorder = 0.0;
  int tottalcountitems = 0;
  TextEditingController? controllercoupon;

  // CartModel? cartModel;

  gettotalprice() {
    return (priceorder - priceorder * discountcoupon! / 100);
  }

  add(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addcart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: Text('تم اضافته من  سلة لمشتريات'));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    update();
    var response = await cartData.removecart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: Text(' تم حذفه من  سلة المشتريات'));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkcoupon() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    update();
    var response = await cartData.checkcoupon(controllercoupon!.text);
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        checkcoponModel = CheckcoponModel.fromJson(datacoupon);
        discountcoupon = int.parse(checkcoponModel!.couponDiscount!);
        couponname = checkcoponModel!.couponName;
        couponid = checkcoponModel!.couponId;
      } else {
        //statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("تنبيه", "this copon is not valid");
      }
    }
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    //  data.clear();
    var response =
        await cartData.viewcart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          tottalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorder = double.parse(dataresponsecountprice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetevarcart() {
    tottalcountitems = 0;
    priceorder = 0.0;
    // data.clear();
  }

  refreshpage() {
    resetevarcart();
    view();
  }

  @override
  void onInit() {
    view();
    controllercoupon = TextEditingController();
    super.onInit();
  }

  ///////////////////////////////////////////////
  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getcountcart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  gotopagecheckout() {
    if (data.isEmpty) return Get.snackbar("تنبية ", "السلة فارغه");

    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorder.toString(),
      "coupondiscount": discountcoupon.toString(),
    });
  }
}
