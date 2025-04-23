import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/offer_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/widget/home/custom%20appbar.dart';
import 'package:ecommercecourse/view/widget/items/customitemslist.dart';
import 'package:ecommercecourse/view/widget/offer/customofferitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Offersview extends StatelessWidget {
  const Offersview({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController offerController = Get.put(OfferController());
    Favoritecontroller favoritecontroller = Get.put(Favoritecontroller());
    Homecontrollerimp homecontrollerimp = Get.put(Homecontrollerimp());
    return GetBuilder<OfferController>(
        builder: (controller) => Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  CustomAppbar(
                    titleappbar: 'Find Producte',
                    onPressedicon: () {},
                    onPressedsearch: () {
                      homecontrollerimp.onsearchitems();
                    },
                    onpressediconfavorite: () {
                      Get.toNamed(AppRoute.myfavorite);
                    },
                    mycontroller: homecontrollerimp.search!,
                    onChanged: (val) {
                      homecontrollerimp.checksearch(val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  !homecontrollerimp.issearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, i) {
                                return Customofferitems(
                                    itemsModel: controller.data[i]);
                              }))
                      : Listitemssearch(
                          listdatamodel: homecontrollerimp.listdata),
                ],
              ),
            ));
  }
}
