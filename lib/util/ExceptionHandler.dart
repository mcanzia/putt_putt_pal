import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

class ExceptionHandler {

  static void showExceptionToast(String message) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        fontSize: 16.0,
        webBgColor: "linear-gradient(to right, #8e7cc3, #8e7cc3)",
      );
    }

  static handleDeleteLastPlayerException() {
    showExceptionToast('There Must Be At Least One Player In The Room.');
  }

  static handleInvalidRoomCode() {
    showExceptionToast('The Provided Room Code Is Not Valid.');
  }

  static handleDuplicateColorException() {
    showExceptionToast('The Selected Color Is Already Taken By Another Player.');
  }

  static handleTextFieldIsEmptyException(String textField) {
    showExceptionToast('Text Field Is Empty: $textField');
  }

  static handleHostPlayerMustBePresentException() {
    showExceptionToast('Host Player Must Be Added Before Starting Game.');
  }

  static handleNumHolesMustBeGreaterThanZeroException() {
    showExceptionToast('Number of Holes Must Be Greater Than 0');
  }

  static handleDuplicateNameException() {
    showExceptionToast('A Player With This Name Already Exists');
  }
}