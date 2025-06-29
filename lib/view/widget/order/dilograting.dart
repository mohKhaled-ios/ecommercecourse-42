import 'package:ecommercecourse/controller/orders/archive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showdialograting(
  BuildContext context,
  String ordersid,
) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
        initialRating: 1.0,
        // your app's name?
        title: Text(
          'Rating Dialog',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message: Text(
          'Tap a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
        // your app's logo?
        image: const FlutterLogo(size: 100),
        submitButtonText: 'Submit',
        commentHint: 'Set your custom comment hint',
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) {
          OrdersArchiveController ordersArchiveController = Get.find();
          ordersArchiveController.submitrating(
              ordersid, response.rating, response.comment);
        }),
  );
  // show the dialog
}
