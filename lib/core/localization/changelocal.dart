import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/functions/fcmconfig.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestperlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar('تنبية', 'الؤجاء تشغيل خدمة تحديث الموقع');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('تنبية', ' الرجاء اعطاء الصلاحية للتطبيق');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar('تنبيه', 'لايمكن استعمال التطبيق بدون اللوكيشن');
    }
  }

  @override
  void onInit() {
    ///////////////////////////
    ///
    requestpermissionnotification();
    fcmconfig();

    ////////////////////////////////
    requestperlocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
