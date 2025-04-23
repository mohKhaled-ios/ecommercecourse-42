import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/notification.dart';
import 'package:ecommercecourse/view/screen/offers.dart';
import 'package:ecommercecourse/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homescreencontroller extends GetxController {
  changepage(int currentpage);
}

class Homescreencontrollerimp extends Homescreencontroller {
  int currenrpage = 0;
  List<Widget> listpage = [
    Home(),
    NotificationView(),
    Offersview(),
    Settings()
  ];

  List bottomapbar = [
    {
      'title': 'home',
      'icon': Icons.home,
    },
    {
      'title': 'ca',
      'icon': Icons.notifications,
    },
    {
      'title': 'offer',
      'icon': Icons.offline_bolt_outlined,
    },
    {
      'title': 'setting',
      'icon': Icons.settings,
    }
  ];

  @override
  changepage(int i) {
    currenrpage = i;
    update();
  }
}
