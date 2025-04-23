import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widget/home/custom%20appbar.dart';
import 'package:ecommercecourse/view/widget/home/custom_card.dart';
import 'package:ecommercecourse/view/widget/home/custom_title_hoe.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontrollerimp controller = Get.put(Homecontrollerimp());
    return GetBuilder<Homecontrollerimp>(
      builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(children: [
            CustomAppbar(
              titleappbar: 'Find Producte',
              onPressedicon: () {},
              onPressedsearch: () {
                controller.onsearchitems();
              },
              onpressediconfavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
              mycontroller: controller.search!,
              onChanged: (val) {
                controller.checksearch(val);
              },
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.issearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.settings.isNotEmpty)
                            Customcardhome(
                                title: '${controller.titlehomecard}',
                                body: '${controller.titlehomecard}'),
                          Customtitlehome(title: 'Categories'),
                          ListCategoryhome(),
                          Customtitlehome(title: 'top selling'),
                          Listitemshome(),
                        ],
                      )
                    : Listitemssearch(listdatamodel: controller.listdata))
          ])),
    );
  }
}

class Listitemssearch extends GetView<Homecontrollerimp> {
  final List<ItemsModel> listdatamodel;
  const Listitemssearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.gopageproductedetails(listdatamodel[i]);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('${listdatamodel[i].itemsName}'),
                            subtitle:
                                Text('${listdatamodel[i].categoriesName}'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
