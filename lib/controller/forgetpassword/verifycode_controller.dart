import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/veryfiycodesignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/forgetpassword/veryfiycode.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToresetpassword(String veryfycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  StatusRequest? statusRequest;
  String? email;
  VreryfycodeforgetpasswordData vreryfycodeforgetpasswordData =
      VreryfycodeforgetpasswordData(Get.find());

  @override
  checkCode() {}

  @override
  goToresetpassword(veryfycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = vreryfycodeforgetpasswordData.postdata(veryfycode, email!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //if (response['status'] == "success") {
      Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      //} else {
      // Get.defaultDialog(
      //title: "ُWarning",
      //    // middleText: "veryfiy code not correct");
      // statusRequest = StatusRequest.failure;
      // }
    }
    //update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
