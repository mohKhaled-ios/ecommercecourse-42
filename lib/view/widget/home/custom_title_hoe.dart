import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class Customtitlehome extends StatelessWidget {
  final String title;
  const Customtitlehome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }
}
