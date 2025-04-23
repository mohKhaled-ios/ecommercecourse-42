import 'package:ecommercecourse/controller/orders/archive_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/ordermodel.dart';
import 'package:ecommercecourse/view/widget/order/dilograting.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.orderdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdcolor,
                    textColor: AppColor.secounderyColor,
                    child: const Text("Details"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (listdata.ordersId == "0")
                    MaterialButton(
                      onPressed: () {
                        showdialograting(context, listdata.ordersId!);
                      },
                      color: AppColor.thirdcolor,
                      textColor: AppColor.secounderyColor,
                      child: const Text("ratings"),
                    ),
                ],
              ),
            ],
          )),
    );
  }
}
