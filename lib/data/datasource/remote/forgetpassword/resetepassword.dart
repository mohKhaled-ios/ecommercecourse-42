import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ResetepasswordData {
  Crud crud;
  ResetepasswordData(this.crud);
  postdata(String password, String email) async {
    var response = await crud.postData(AppLink.resetepassword, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
