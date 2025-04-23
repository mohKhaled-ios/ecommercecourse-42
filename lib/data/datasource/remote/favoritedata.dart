import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class favoriteData {
  Crud crud;
  favoriteData(this.crud);
  addfavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.addfavorite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removefavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.removefavorite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
