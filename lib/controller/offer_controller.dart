import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/offer_data.dart';
import 'package:ecommercecourse/data/datasource/remote/test_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  gopageproductedetails(itemsmodel) {
    Get.toNamed(AppRoute.detailesscreen, arguments: {
      "itemsmodel": itemsmodel,
    });
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
