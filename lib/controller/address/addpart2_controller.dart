// import 'package:ecommercecourse/core/constant/routes.dart';
// import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
// import 'package:ecommercecourse/core/services/services.dart';
// import 'package:ecommercecourse/data/datasource/remote/addressdata.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:get/get.dart';

// import '../../core/class/statusrequest.dart';

// class AddressDetailscontroller extends GetxController {
//   StatusRequest statusRequest = StatusRequest.none;
//   AddressData addressData = AddressData(Get.find());

//   MyServices myServices = Get.find();
//   TextEditingController? name;
//   TextEditingController? city;
//   TextEditingController? street;
//   String? lat;
//   String? long;
//   initialData() {
//     name = TextEditingController();
//     city = TextEditingController();
//     street = TextEditingController();

//     lat = Get.arguments['lat'];
//     long = Get.arguments['long'];

//     print(lat);
//     print(long);
//   }

//   addAddress() async {
//     statusRequest = StatusRequest.loading;
//     update();

//     var response = await addressData.addData(
//         myServices.sharedPreferences.getString("id")!,
//         name!.text.toString(),
//         city!.text.toString(),
//         street!.text.toString(),
//         lat.toString(),
//         long.toString());

//     print("=============================== Controller $response ");

//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         // Get.offAllNamed(AppRoute.home);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     initialData();
//     super.onInit();
//   }
// }
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/addressdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'] as String;
    long = Get.arguments['long'] as String;

    print(lat);
    print(long);
    print(name);
    print(city);
    print(street);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!.toString(),
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar('errorr', 'Now , you can order address');
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
