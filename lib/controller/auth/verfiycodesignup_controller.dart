import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/veryfiycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String veryfiycodesignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiycodesignupData verfiycodesignupData = VerfiycodesignupData(Get.find());

  String? email;
  StatusRequest? statusRequest;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(veryfiycodesignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = verfiycodesignupData.postdata(email!, veryfiycodesignup);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //if (response['status'] == "success") {
      Get.offNamed(AppRoute.successSignUp);
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
