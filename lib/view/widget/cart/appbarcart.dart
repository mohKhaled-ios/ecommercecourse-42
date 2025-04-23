import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbarcart extends StatelessWidget {
  final String title;

  const Appbarcart({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
          )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '$title',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
