import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onpress;
  final String textbutton;
  final IconData iconData;

  final bool active;
  const CustomButtonAppBar(
      {super.key,
      required this.onpress,
      required this.textbutton,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primaryColor : Colors.grey[800],
          ),
          // Text(textbutton),
        ],
      ),
    );
  }
}
