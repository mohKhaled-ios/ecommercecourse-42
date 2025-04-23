import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class MyfavoriteData {
  Crud crud;
  MyfavoriteData(this.crud);

  deleteData(String id) async {
    var response =
        await crud.postData(AppLink.deletefromfavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteview, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
