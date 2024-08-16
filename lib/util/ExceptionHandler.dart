import "package:another_flushbar/flushbar.dart";
import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:putt_putt_pal/router.dart";

class ExceptionHandler {
  static void showExceptionToast(String message) {
    Flushbar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.yellow[100]!,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      borderRadius: BorderRadius.circular(15.0),
      padding: const EdgeInsets.all(10.0),
      borderColor: Colors.yellow[900],
      borderWidth: 2,
      messageText: Container(
          width: MediaQuery.of(navigatorKey.currentState!.overlay!.context)
                  .size
                  .width /
              2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 28.0,
                color: Colors.yellow[900],
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.yellow[900], fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
    ).show(navigatorKey.currentState!.overlay!.context);
  }

  static handleDeleteLastPlayerException() {
    showExceptionToast('There Must Be At Least One Player In The Room');
  }

  static handleInvalidRoomCode() {
    showExceptionToast('The Provided Room Code Is Not Valid');
  }

  static handleDuplicateColorException() {
    showExceptionToast(
        'The Selected Color Is Already Taken By Another Player');
  }

  static handleTextFieldIsEmptyException(String textField) {
    showExceptionToast('Text Field Is Empty: $textField');
  }

  static handleHostPlayerMustBePresentException() {
    showExceptionToast('Host Player Must Be Added Before Starting Game');
  }

  static handleNumHolesMustBeGreaterThanZeroException() {
    showExceptionToast('Number of Holes Must Be Greater Than 0');
  }

  static handleDuplicateNameException() {
    showExceptionToast('A Player With This Name Already Exists');
  }

  static handleNotANumberException() {
    showExceptionToast('Entry Must Be A Number');
  }
}
