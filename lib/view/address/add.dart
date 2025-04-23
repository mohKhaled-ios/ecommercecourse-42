import 'package:ecommercecourse/controller/address/add_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Addresscontroller addaddresscontroller = Get.put(Addresscontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new dresses"),
      ),
      body: Container(
          child: GetBuilder<Addresscontroller>(
              builder: (addaddresscontroller) => HandlingDataView(
                    statusRequest: addaddresscontroller.statusRequest,
                    widget: Column(
                      children: [
                        if (addaddresscontroller.kGooglePlex != null)
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                GoogleMap(
                                  mapType: MapType.normal,
                                  markers: addaddresscontroller.markers.toSet(),
                                  onTap: (latlong) {
                                    addaddresscontroller.addMarkers(latlong);
                                  },
                                  initialCameraPosition:
                                      addaddresscontroller.kGooglePlex!,
                                  onMapCreated:
                                      (GoogleMapController controllermap) {
                                    addaddresscontroller.completercontroller!
                                        .complete(controllermap);
                                  },
                                ),
                                Positioned(
                                    bottom: 10,
                                    child: MaterialButton(
                                      minWidth: 200,
                                      textColor: Colors.white,
                                      color: AppColor.primaryColor,
                                      onPressed: () {
                                        addaddresscontroller
                                            .goToPageAddDetailsAddress();
                                      },
                                      child: Text('اكمال'),
                                    ))
                              ],
                            ),
                          ),
                      ],
                    ),
                  ))),
    );
  }
}
