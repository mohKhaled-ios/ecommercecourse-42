import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/homedata.dart';
import 'package:ecommercecourse/data/datasource/remote/itemesdata.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Itemscontroller extends GetxController {
  intialData();
  changecat(int val, String id);
  getitems(String categoryid);
  gopageproductedetails(ItemsModel itemsModel);
}

class itemscontrollerimp extends Itemscontroller {
  List categories = [];
  int? selectedcat;
  late String
      catid; /////////////////////////////////////////////////////////////////////////nnnnnn

  List<ItemsModel> listdata = [];
  HomeData hometData = HomeData(Get.find());
  TextEditingController? search;
  bool issearch = false;
  String? deliverytime;

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

  @override
  intialData() {
    categories = Get.arguments["categories"];
    selectedcat = Get.arguments["selectedcat"];
    catid = Get.arguments["catid"];
    deliverytime = myServices.sharedPreferences.getString('deliverytime')!;
    getitems(catid);
  }

  ItemesData itemesData = ItemesData(Get.find());

  List data = [];

  StatusRequest? statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();

    super.onInit();
  }

  @override
  changecat(val, catval) {
    selectedcat = val;
    catid = catval;
    getitems(catid);
    update();
  }

  @override
  getitems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemesData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

@override
gopageproductedetails(itemsmodel) {
  Get.toNamed(AppRoute.detailesscreen, arguments: {
    "itemsmodel": itemsmodel,
  });
}
