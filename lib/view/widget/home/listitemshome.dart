import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listitemshome extends GetView<Homecontrollerimp> {
  const Listitemshome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (context, i) {
              return Items(
                  itemsModel: ItemsModel.fromJson(controller.items[i]));
            }));
  }
}

class Items extends GetView<Homecontrollerimp> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gopageproductedetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),

            //////خالى بالك تتغير دى
            child: Image.asset(
              "assets/images/logo.png",
              //"${AppLink.imagesitems}/${controller.items[i]['items_image']}",
              color: AppColor.secounderyColor,
              width: 150,
              height: 100,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                '${itemsModel.itemsName} ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
    ;
  }
}
