import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/view/widget/cart/appbarcart.dart';
import 'package:ecommercecourse/view/widget/cart/buttoncart.dart';
import 'package:ecommercecourse/view/widget/cart/custombuttonnavigationbar.dart';
import 'package:ecommercecourse/view/widget/cart/customitemcardcart.dart';
import 'package:ecommercecourse/view/widget/cart/topcartcard.dart';
import 'package:ecommercecourse/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller cartcontroller = Get.put(Cartcontroller());
    return Scaffold(
        bottomNavigationBar: GetBuilder<Cartcontroller>(
            builder: (cartcontroller) => HandlingDataRequest(
                  statusRequest: cartcontroller.statusRequest,
                  widget: Custombuttonnavigationbar(
                    price: '${cartcontroller.priceorder}',
                    discount: '${cartcontroller.discountcoupon}',
                    tottalprice: '${cartcontroller.gettotalprice()}',
                    controllercupon: cartcontroller.controllercoupon!,
                    onapply: () {
                      cartcontroller.checkcoupon();
                    },
                    shipping:
                        '${cartcontroller.checkcoponModel?.couponDiscount}',
                  ),
                )),
        body: GetBuilder<Cartcontroller>(
            builder: (controller) => HandlingDataView(
                  statusRequest: cartcontroller.statusRequest,
                  widget: ListView(
                    children: [
                      Appbarcart(
                        title: 'My Cart',
                      ),
                      Topcartcard(
                        message:
                            'You Have ${cartcontroller.tottalcountitems} Items In Your Cart',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              controller.data.length,
                              (index) => Customitemscardcart(
                                image: 'assets/images/logo.png',
                                title:
                                    '${cartcontroller.data[index].itemsName}',
                                price:
                                    '${cartcontroller.data[index].itemsPrice}',
                                count:
                                    '${cartcontroller.data[index].countitems}',
                                onadd: () async {
                                  await cartcontroller
                                      .add(cartcontroller.data[index].itemsId!);
                                  cartcontroller.refreshpage();
                                },
                                ondelete: () async {
                                  await cartcontroller.delete(
                                      cartcontroller.data[index].itemsId!);
                                  cartcontroller.refreshpage();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
