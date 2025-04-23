// import 'package:ecommercecourse/core/constant/color.dart';
// import 'package:ecommercecourse/core/constant/imgaeasset.dart';
// import 'package:flutter/material.dart';

// import '../widget/checkout/carddeliverytype.dart';
// import '../widget/checkout/cardpaymentmethodcheckout.dart';
// import '../widget/checkout/ccardshippingaddress.dart';

// class Checkout extends StatelessWidget {
//   const Checkout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: MaterialButton(
//           color: AppColor.secounderyColor,
//           textColor: Colors.white,
//           onPressed: () {},
//           child: Text(
//             'Checkout',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//         ),
//       ),
//       body: Container(
//         child: ListView(
//           children: [
//             Text(
//               'CHOSE PAYMET METHOD',
//               style: TextStyle(
//                   color: AppColor.secounderyColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CardPaymentMethodCheckout(
//                 title: "cash on delivery", isActive: true),
//             SizedBox(
//               height: 20,
//             ),
//             CardPaymentMethodCheckout(title: "payment card", isActive: false),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'CHOSE Delivery Type',
//               style: TextStyle(
//                   color: AppColor.secounderyColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   CardDeliveryTypeCheckout(
//                       imagename: AppImageAsset.onBoardingImageOne,
//                       title: "Delivery",
//                       active: true),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   CardDeliveryTypeCheckout(
//                       imagename: AppImageAsset.onBoardingImageOne,
//                       title: 'delivery thrud',
//                       active: false),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Shipping cart',
//               style: TextStyle(
//                   color: AppColor.secounderyColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             CardShppingAddressCheckout(
//                 title: "Home",
//                 body: "Damascus street one building 23",
//                 isactive: true),
//             SizedBox(
//               height: 10,
//             ),
//             CardShppingAddressCheckout(
//                 title: "company",
//                 body: 'Damascus street one building 23',
//                 isactive: false)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommercecourse/controller/checkoutcontroller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommercecourse/view/widget/checkout/cardpaymentmethodcheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/checkout/ccardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secounderyColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                            color: AppColor.secounderyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Cash On Delivery",
                            isActive:
                                controller.paymentMethod == "0" ? true : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Payment Cards",
                            isActive:
                                controller.paymentMethod == "1" ? true : false),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose Delivery Type",
                        style: TextStyle(
                            color: AppColor.secounderyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0");
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.onBoardingImageOne,
                                title: "Delivery",
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1");
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.onBoardingImageOne,
                                title: "Revice",
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.dataaddress.isNotEmpty)
                              const Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: AppColor.secounderyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            if (controller.dataaddress.isEmpty)
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.addressadd);
                                },
                                child: Container(
                                  child: Text(
                                    'please add shipping address \n Click Here',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId!);
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  )))),
    );
  }
}
