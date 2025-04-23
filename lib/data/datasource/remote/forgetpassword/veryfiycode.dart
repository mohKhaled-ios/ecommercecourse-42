import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class VreryfycodeforgetpasswordData {
  Crud crud;
  VreryfycodeforgetpasswordData(this.crud);
  postdata(String veryfycode, String email) async {
    var response = await crud.postData(AppLink.verifycodeforgetpasswors,
        {"email": email, "verifycode": veryfycode});
    return response.fold((l) => l, (r) => r);
  }
}
