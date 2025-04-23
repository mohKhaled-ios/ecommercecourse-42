import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoryhome extends GetView<Homecontrollerimp> {
  const ListCategoryhome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (Context, index) {
          return Categories(
              i: index,
              categoriesmodel:
                  Categoriesmodel.fromJson(controller.categories[index]));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<Homecontrollerimp> {
  final Categoriesmodel categoriesmodel;
  final int i;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        controller.gotoitems(
            controller.categories, i, categoriesmodel.categoriesId!);
      }),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdcolor,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imagestatic}/${categoriesmodel.categoriesImage}",
              color: AppColor.secounderyColor,
            ),
          ),
          Text(
            "${translateDatabase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
