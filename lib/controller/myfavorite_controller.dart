import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';

import 'package:get/get.dart';

import '../data/datasource/remote/myfavorite_data.dart';

class MyFavoritecontroller extends GetxController {
  List<MyfavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyfavoriteData favoritdata = MyfavoriteData(Get.find());
  MyServices myServices = Get.find();

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritdata
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List respondedata = response['data'];
        data.addAll(respondedata.map((e) => MyfavoriteModel.fromJson(e)));
        print('data');
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletefromyfavorite(String favoriteid) {
    //data.clear();
    // statusRequest = StatusRequest.loading;

    var response = favoritdata.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId == favoriteid);

    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
