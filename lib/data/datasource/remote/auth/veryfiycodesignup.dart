import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class VerfiycodesignupData {
  Crud crud;
  VerfiycodesignupData(this.crud);

  postdata(String email, String verifycpde) async {
    var response = await crud.postData(AppLink.verfiycode, {
      "email": email,
      "verifycode": verifycpde,
    });
    return response.fold((l) => l, (r) => r);
  }
}
