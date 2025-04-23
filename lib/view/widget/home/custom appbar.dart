import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String titleappbar;
  final void Function() onPressedicon;
  final void Function() onpressediconfavorite;
  final void Function() onPressedsearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  CustomAppbar(
      {super.key,
      required this.titleappbar,
      required this.onPressedicon,
      required this.onPressedsearch,
      required this.onpressediconfavorite,
      required this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: onPressedsearch, icon: Icon(Icons.search)),
              hintText: titleappbar,
              hintStyle: TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              width: 60,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                onPressed: onpressediconfavorite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Colors.grey[600],
                ),
              ))
        ]));
  }
}
