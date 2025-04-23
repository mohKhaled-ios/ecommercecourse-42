import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.archive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(
    String id,
    String comment,
    String rating,
  ) async {
    var response = await crud.postData(
        AppLink.rating, {"comment": comment, "rating": rating, "id": id});
    return response.fold((l) => l, (r) => r);
  }
}
