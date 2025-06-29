// class OrdersModel {
//   String? ordersId;
//   String? ordersUsersid;
//   String? ordersAddress;
//   String? ordersType;
//   String? ordersPricedelivery;
//   String? ordersPrice;
//   String? ordersCoubon;
//   String? ordersDatetime;
//   String? ordersPaymentmethod;
//   String? ordersTotalprice;
//   String? ordersStatus;

//   OrdersModel(
//       {this.ordersId,
//       this.ordersUsersid,
//       this.ordersAddress,
//       this.ordersType,
//       this.ordersPricedelivery,
//       this.ordersPrice,
//       this.ordersCoubon,
//       this.ordersDatetime,
//       this.ordersPaymentmethod,
//       this.ordersTotalprice,
//       this.ordersStatus});

//   OrdersModel.fromJson(Map<String, dynamic> json) {
//     ordersId = json['orders_id'];
//     ordersUsersid = json['orders_usersid'];
//     ordersAddress = json['orders_address'];
//     ordersType = json['orders_type'];
//     ordersPricedelivery = json['orders_pricedelivery'];
//     ordersPrice = json['orders_price'];
//     ordersCoubon = json['orders_coubon'];
//     ordersDatetime = json['orders_datetime'];
//     ordersPaymentmethod = json['orders_paymentmethod'];
//     ordersTotalprice = json['orders_totalprice'];
//     ordersStatus = json['orders_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orders_id'] = this.ordersId;
//     data['orders_usersid'] = this.ordersUsersid;
//     data['orders_address'] = this.ordersAddress;
//     data['orders_type'] = this.ordersType;
//     data['orders_pricedelivery'] = this.ordersPricedelivery;
//     data['orders_price'] = this.ordersPrice;
//     data['orders_coubon'] = this.ordersCoubon;
//     data['orders_datetime'] = this.ordersDatetime;
//     data['orders_paymentmethod'] = this.ordersPaymentmethod;
//     data['orders_totalprice'] = this.ordersTotalprice;
//     data['orders_status'] = this.ordersStatus;
//     return data;
//   }
// }

class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersCoubon;
  String? ordersDatetime;
  String? ordersPaymentmethod;
  String? ordersTotalprice;
  String? ordersStatus;
  String? ordersRating;
  String? ordersNoterating;
  /////////////////////////////////////////////////
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoubon,
      this.ordersDatetime,
      this.ordersPaymentmethod,
      this.ordersTotalprice,
      this.ordersStatus,
      this.ordersRating,
      this.ordersNoterating,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoubon = json['orders_coubon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coubon'] = this.ordersCoubon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_status'] = this.ordersStatus;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
