import 'package:ecommercecourse/controller/setting_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Settingcontroller controller = Get.put(Settingcontroller());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                color: AppColor.primaryColor,
              ),
              Positioned(
                  top: Get.width / 2.5,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ListTile(
                  //   title: Text('Disable Notifcation'),
                  //   trailing: Switch(value: true, onChanged: (val) {}),
                  // ),
                  Divider(),
                  ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.pending);
                      },
                      title: Text('orders'),
                      trailing: Icon(Icons.card_travel)),
                  Divider(),
                  ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.ordersarchive);
                      },
                      title: Text('archive'),
                      trailing: Icon(Icons.card_travel)),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: Text('Address'),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('About Us'),
                    trailing: Icon(Icons.person),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+201276704083"));
                    },
                    title: Text('Contact Us'),
                    trailing: Icon(Icons.call),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text('Log Out'),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
