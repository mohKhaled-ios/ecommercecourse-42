import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryitems extends GetView<itemscontrollerimp> {
  const ListCategoryitems({super.key});

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

class Categories extends GetView<itemscontrollerimp> {
  final Categoriesmodel categoriesmodel;
  final int i;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        controller.changecat(i, categoriesmodel.categoriesId!);
      }),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GetBuilder<itemscontrollerimp>(builder: (controller) {
            return Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              decoration: controller.selectedcat == i
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColor.primaryColor)))
                  : null,
              child: Text(
                "${translateDatabase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            );
          })
        ],
      ),
    );
  }
}
