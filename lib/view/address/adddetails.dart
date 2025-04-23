import 'package:ecommercecourse/controller/address/addpart2_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/services/shared/custombutton.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/address/add_controller.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add details adresses"),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 10, right: 20, left: 20),
          //padding: EdgeInsets.all(10),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        CustomTextFormAuth(
                            hinttext: 'city',
                            labeltext: 'city',
                            iconData: Icons.location_city,
                            mycontroller: controller.city,
                            valid: (val) {},
                            isNumber: false),
                        CustomTextFormAuth(
                            hinttext: 'street',
                            labeltext: 'street',
                            iconData: Icons.streetview,
                            mycontroller: controller.street,
                            valid: (val) {},
                            isNumber: false),
                        CustomTextFormAuth(
                            hinttext: 'name',
                            labeltext: 'name',
                            iconData: Icons.near_me,
                            mycontroller: controller.name,
                            valid: (val) {},
                            isNumber: false),
                        CustomButtom(
                          text: 'Add',
                          onPressed: () {
                            controller.addAddress();
                          },
                        )
                      ],
                    ),
                  ))
          //)
          ),
    );
  }
}
