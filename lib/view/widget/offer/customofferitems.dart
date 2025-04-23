import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/offer_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customofferitems extends GetView<OfferController> {
  final ItemsModel itemsModel;
  //final bool active;
  const Customofferitems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        controller.gopageproductedetails(itemsModel);
      }),
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ////////////////////////////////خالى بالك تتغير
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      height: 100,
                      imageUrl:
                          'https://m.media-amazon.com/images/I/61+G7HYXoKL.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Image.network(AppLink.imagesitems+"")

                  Text(
                    '${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ٌRating : 3.5'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(5, (inndex) {
                              return Icon(
                                Icons.star,
                                size: 15,
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemspriceDiscount} \$",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<Favoritecontroller>(builder: (controller) {
                        return InkWell(
                          onTap: (() {
                            if (controller.isfavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setfavorite(itemsModel.itemsId, "0");
                              controller.removefavorite(itemsModel.itemsId!);
                            } else {
                              controller.setfavorite(itemsModel.itemsId, "1");
                              controller.addfavorite(itemsModel.itemsId!);
                            }
                          }),
                          child: Icon(
                            controller.isfavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                        );
                      })
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 4,
                left: 4,
                child: Image.asset(
                  'assets/images/sale.jpg',
                  width: 90,
                ),
              )
          ],
        ),
      ),
    );
  }
}
