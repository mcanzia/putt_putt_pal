import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:putt_putt_pal/models/CustomException.dart";

class ExceptionHandler {

  static void showExceptionToast(String message) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }

  static handleDeleteLastPlayerException() {
    showExceptionToast('There must be at least one player in the room.');
  }
}