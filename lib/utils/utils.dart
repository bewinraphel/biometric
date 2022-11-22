import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String messange) {
    Fluttertoast.showToast(msg: messange);
  }

  static flushBarErrorMessange(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          message: message,
          backgroundColor: Colors.red,
          positionOffset: 30,
          // flushbarPosition: FlushbarPosition.TOP,
          title: 'ERROR ',
          duration: Duration(seconds: 4),
          icon: Icon(
            Icons.error,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }
}
