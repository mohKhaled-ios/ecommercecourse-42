import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addcart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removecart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getcountcart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetecountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewcart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
