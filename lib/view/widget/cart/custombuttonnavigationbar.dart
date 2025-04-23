import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Custombuttonnavigationbar extends GetView<Cartcontroller> {
  final String price;
  final String discount;
  final String tottalprice;
  final String shipping;
  final TextEditingController controllercupon;
  final void Function()? onapply;
  const Custombuttonnavigationbar({
    super.key,
    required this.price,
    required this.discount,
    required this.tottalprice,
    required this.controllercupon,
    required this.onapply,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<Cartcontroller>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllercupon,
                                decoration: InputDecoration(
                                    hintText: "cuponcode",
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8)),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomButtoncoupon(
                                textbutton: "Apply",
                                onPressed: onapply,
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        'coupon name: ${controller.couponname}',
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    )),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'price',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '$price\$',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'discount',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                '$discount \$',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'shipping',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                '$shipping \$',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'total price',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                '$tottalprice \$',
                style: TextStyle(fontSize: 18, color: AppColor.primaryColor),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: 350,
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  //      Get.toNamed(AppRoute.checkout);
                  controller.gotopagecheckout();
                },
                child: Text('order')),
          )
        ],
      ),
    );
  }
}
