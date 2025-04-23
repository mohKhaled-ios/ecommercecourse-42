// import 'dart:async';

// import 'package:ecommercecourse/core/class/statusrequest.dart';
// import 'package:ecommercecourse/core/constant/routes.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Addresscontroller extends GetxController {
//   StatusRequest statusRequest = StatusRequest.loading;
//   Position? position;
//   double? lat;
//   double? long;
//   Completer<GoogleMapController>? controllermap;
//   List<Marker> markers = [];
//   CameraPosition? kGooglePlex;
//   getcurrentlocation() async {
//     position = await Geolocator.getCurrentPosition();
//     kGooglePlex = CameraPosition(
//       target: LatLng(position!.latitude, position!.longitude),
//       zoom: 14.4746,
//     );
//     statusRequest = StatusRequest.none;
//     update();
//   }

//   addmarkers(LatLng latLng) {
//     markers.clear();
//     markers.add(Marker(markerId: MarkerId('1'), position: latLng));
//     lat = latLng.latitude;
//     long = latLng.longitude;
//     update();
//   }

//   goToPageAddDetailsAddress() {
//     Get.toNamed(AppRoute.addressaddDetails,
//         arguments: {"lat": lat.toString(), "long": long.toString()});
//   }

//   @override
//   void onInit() {
//     controllermap = Completer<GoogleMapController>();
//     getcurrentlocation();
//     super.onInit();
//   }
// }
import 'dart:async';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Addresscontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressaddDetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  late Position postion;

  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(postion!.latitude, postion!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
