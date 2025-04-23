import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customitemscardcart extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String count;
  final void Function()? onadd;
  final void Function()? ondelete;
  const Customitemscardcart({
    super.key,
    required this.onadd,
    required this.ondelete,
    required this.image,
    required this.title,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  '$image',
                  fit: BoxFit.cover,
                  height: 90,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text('$title'),
                  subtitle: Text(
                    '$price\$',
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 20),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                    height: 35,
                    child: IconButton(onPressed: onadd, icon: Icon(Icons.add))),
                Container(
                    height: 30,
                    child: Text(
                      '$count',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                  height: 25,
                  child:
                      IconButton(onPressed: ondelete, icon: Icon(Icons.remove)),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
