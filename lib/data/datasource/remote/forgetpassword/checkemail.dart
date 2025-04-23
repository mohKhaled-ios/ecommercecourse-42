import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class CheckemailData {
  Crud crud;
  CheckemailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.checkemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
