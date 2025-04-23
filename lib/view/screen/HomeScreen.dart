import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/widget/home/custom_button_abbbar.dart';
import 'package:ecommercecourse/view/widget/home/custombuttonabbbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescreencontrollerimp());
    return GetBuilder<Homescreencontrollerimp>(builder: (controller) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Custommbuttomabbparhome(),
          body: controller.listpage.elementAt(controller.currenrpage));
    });
  }
}
