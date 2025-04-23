import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.offer, {});
    return response.fold((l) => l, (r) => r);
  }
}
