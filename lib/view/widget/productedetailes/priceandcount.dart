import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final void Function()? onadd;
  final void Function()? onremove;
  final String price;
  final String quantity;
  const PriceAndCount(
      {super.key,
      required this.onadd,
      required this.price,
      required this.quantity,
      required this.onremove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: onadd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.topCenter,
              height: 40,
              width: 50,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                '${quantity}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            IconButton(onPressed: onremove, icon: Icon(Icons.remove))
          ],
        ),
        Spacer(),
        Text(
          '${price}',
          style: TextStyle(color: AppColor.primaryColor, fontSize: 30),
        ),
      ],
    );
  }
}
