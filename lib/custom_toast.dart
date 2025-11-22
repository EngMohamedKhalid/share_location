import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void error(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        textColor: Colors.white,
        fontSize: 16,
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 6
    );
  }

  static void success(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        textColor: Colors.white,
        fontSize: (16),
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        timeInSecForIosWeb: 6
    );
  }
}