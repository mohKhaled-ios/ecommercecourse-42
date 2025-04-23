import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customlistfavoriteitems extends GetView<MyFavoritecontroller> {
  final MyfavoriteModel itemsModel;

  const Customlistfavoriteitems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        // controller.gopageproductedetails(itemsModel);
      }),
      child: Card(
        child: Padding(
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
                    "${itemsModel.itemsPrice} \$",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.deletefromyfavorite(itemsModel.favoriteId!);
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primaryColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
