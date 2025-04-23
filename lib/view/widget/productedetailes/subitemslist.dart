import 'package:ecommercecourse/controller/details_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subitemslist extends GetView<Productedetailscontrollerimp> {
  const Subitemslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitemslist.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              bottom: 5,
            ),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitemslist[index]['active'] == "1"
                    ? Colors.black
                    : Colors.white,
                border: Border.all(
                  color: AppColor.black,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              '${controller.subitemslist[index]['name']}',
              style: TextStyle(
                  color: controller.subitemslist[index]['active'] == "1"
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
