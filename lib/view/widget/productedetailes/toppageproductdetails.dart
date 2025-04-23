import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/details_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Toppageproductedetails extends GetView<Productedetailscontrollerimp> {
  const Toppageproductedetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        ////////////////خالى بالك
        Positioned(
          top: 50.0,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl: 'https://m.media-amazon.com/images/I/61+G7HYXoKL.jpg',
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
        // CachedNetworkImage(imageUrl: AppLink.imagesitems+"/"+controller.itemsModel.itemsImage!,height: 200,),
      ],
    );
  }
}
