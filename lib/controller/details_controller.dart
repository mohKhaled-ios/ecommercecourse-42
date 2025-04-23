import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../data/model/checkcouponmodel.dart';

abstract class Productedetailscontroller extends GetxController {}

class Productedetailscontrollerimp extends Productedetailscontroller {
  Cartcontroller cartcontroller = Get.put(Cartcontroller());
  late ItemsModel itemsModel;

  late StatusRequest statusRequest;
  int countitems = 0;
  List subitemslist = [
    {
      "name": "red",
      "id": 1,
      "active": "1",
    },
    {
      "name": "black",
      "id": 2,
      "active": "0",
    },
    {
      "name": "yellow",
      "id": 3,
      "active": "1",
    },
  ];
  add() {
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      countitems--;
      update();
    }
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await cartcontroller.getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
