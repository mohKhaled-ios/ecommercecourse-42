import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/homedata.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class Homecontroller extends GetxController {
  intialData();
  getdata();
  gotoitems(List categories, int selectedcat, String categoryid);
}

class Homecontrollerimp extends Homecontroller {
  MyServices myServices = Get.find();
  List<ItemsModel> listdata = [];
  String? username;
  String? id;
  HomeData hometData = HomeData(Get.find());
  String? lang;
  List data = [];
  List categories = [];
  List items = [];
  List settings = [];

  late StatusRequest statusRequest;
  TextEditingController? search;
  bool issearch = false;
  String titlehomecard = '';
  String bodyhomecard = '';
  String deliverytime = '';

  checksearch(val) {
    if (val == "") {
      issearch = false;
    }
    update();
  }

  onsearchitems() {
    issearch = true;
    searchdata();
    update();
  }

  @override
  intialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  void onInit() {
    search = TextEditingController();

    getdata();
    intialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await hometData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settings.addAll(response['settings']['data']);
        titlehomecard = settings[0]['settings_titlehome'];
        bodyhomecard = settings[0]['settings_bodyhome'];
        deliverytime = settings[0]['settings_deliverytime'];
        myServices.sharedPreferences.setString('deliverytime', deliverytime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoitems(categories, selectedcat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "catid": categoryid,
    });
  }

  searchdata() async {
    statusRequest = StatusRequest.loading;
    var response = await hometData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsdata = response['data'];

        listdata.addAll(responsdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gopageproductedetails(itemsmodel) {
    Get.toNamed(AppRoute.detailesscreen, arguments: {
      "itemsmodel": itemsmodel,
    });
  }
}
