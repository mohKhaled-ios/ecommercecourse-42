import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/favoritedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Favoritecontroller extends GetxController {
  List data = [];
  late StatusRequest statusRequest;
  favoriteData favoritdata = favoriteData(Get.find());
  MyServices myServices = Get.find();
  Map isfavorite = {};
  setfavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addfavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritdata.addfavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: Text('تم اضافته من المفضله'));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removefavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritdata.removefavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: Text('تم حذفه من المفضله'));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
