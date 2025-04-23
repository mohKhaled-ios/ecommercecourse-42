import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/widget/home/custom_button_abbbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custommbuttomabbparhome extends StatelessWidget {
  const Custommbuttomabbparhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homescreencontrollerimp>(builder: (controller) {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listpage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? Spacer()
                  : CustomButtonAppBar(
                      active: controller.currenrpage == i ? true : false,
                      onpress: (() {
                        controller.changepage(i);
                      }),
                      textbutton: controller.bottomapbar[i]['title'],
                      iconData: controller.bottomapbar[i]['icon']);
            }),
          ],
        ),
      );
    });
  }
}
