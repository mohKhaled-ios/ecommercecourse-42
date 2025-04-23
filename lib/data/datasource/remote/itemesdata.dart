import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ItemesData {
  Crud crud;
  ItemesData(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(AppLink.items, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
