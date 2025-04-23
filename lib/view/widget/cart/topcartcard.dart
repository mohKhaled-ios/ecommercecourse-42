import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class Topcartcard extends StatelessWidget {
  final String message;
  const Topcartcard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 20),
      //  height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
      ),
      child: Text(
        '$message',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
