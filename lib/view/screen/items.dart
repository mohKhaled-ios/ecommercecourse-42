import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/screen/home.dart';

import 'package:ecommercecourse/view/widget/home/custom%20appbar.dart';

import 'package:ecommercecourse/view/widget/items/customitemslist.dart';
import 'package:ecommercecourse/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsscreen extends StatelessWidget {
  const Itemsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(itemscontrollerimp());
    Favoritecontroller controllerfav = Get.put(Favoritecontroller());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<itemscontrollerimp>(builder: (controller) {
            return ListView(children: [
              // CustomAppbar(
              //   titleappbar: 'Find Producte',
              //   onPressedicon: () {},
              //   onPressedsearch: () {},
              //   onpressediconfavorite: () {
              //     Get.toNamed(AppRoute.myfavorite);
              //   },
              // ),
              CustomAppbar(
                titleappbar: 'Find Producte',
                onPressedicon: () {},
                onPressedsearch: () {
                  controller.onsearchitems();
                },
                onpressediconfavorite: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
                mycontroller: controller.search!,
                onChanged: (val) {
                  controller.checksearch(val);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListCategoryitems(),
              HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: !controller.issearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.5),
                          itemBuilder: ((context, index) {
                            controllerfav.isfavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return Customlistitems(
                                itemsModel: ItemsModel.fromJson(
                                    controller.data[index]));
                          }))
                      : Listitemssearch(listdatamodel: controller.listdata))
            ]);
          })),
    );
  }
}
