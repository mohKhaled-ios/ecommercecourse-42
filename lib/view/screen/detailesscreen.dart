import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/details_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/widget/productedetailes/priceandcount.dart';
import 'package:ecommercecourse/view/widget/productedetailes/subitemslist.dart';
import 'package:ecommercecourse/view/widget/productedetailes/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailesscreen extends StatelessWidget {
  const Detailesscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Productedetailscontrollerimp controller =
        Get.put(Productedetailscontrollerimp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.secounderyColor,
            onPressed: (() {
              controller.cartcontroller.refreshpage();
              Get.toNamed(AppRoute.cart);
            }),
            child: Text(
              "Go To Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<Productedetailscontrollerimp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      child: ListView(
                    children: [
                      Toppageproductedetails(),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${controller.itemsModel.itemsName}',
                                style: Theme.of(context).textTheme.displayLarge),
                            SizedBox(
                              height: 10,
                            ),
                            PriceAndCount(
                              price:
                                  '${controller.itemsModel.itemspriceDiscount}',
                              quantity: '${controller.countitems}',
                              onadd: () {
                                controller.cartcontroller
                                    .add(controller.itemsModel.itemsId!);
                                controller.add();
                              },
                              onremove: () {
                                controller.cartcontroller
                                    .delete(controller.itemsModel.itemsId!);
                                controller.remove();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('${controller.itemsModel.itemsDesc}',
                                style: Theme.of(context).textTheme.bodyLarge),
                            SizedBox(
                              height: 10,
                            ),
                            Text('color',
                                style: Theme.of(context).textTheme.displayLarge),
                            SizedBox(
                              height: 10,
                            ),
                            Subitemslist(),
                          ],
                        ),
                      ),
                    ],
                  )),
                )));
  }
}
