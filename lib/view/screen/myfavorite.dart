import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/home/custom%20appbar.dart';
import 'package:ecommercecourse/view/widget/myfavorite/custamfavoritelistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritecontroller());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoritecontroller>(
            builder: (controller) => ListView(
              children: [
                // CustomAppbar(
                //   titleappbar: 'Find Producte',
                //   onPressedicon: () {},
                //   onPressedsearch: () {},
                //   onpressediconfavorite: () {
                //     Get.toNamed(AppRoute.myfavorite);
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return Customlistfavoriteitems(
                            itemsModel: controller.data[index],
                          );
                        }))
              ],
            ),
          )),
    );
  }
}
