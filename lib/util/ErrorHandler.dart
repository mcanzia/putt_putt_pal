import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:putt_putt_pal/router.dart';

class ErrorHandler {
  static void showErrorToast(String message) {
    Flushbar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red[100]!,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      borderRadius: BorderRadius.circular(15.0),
      padding: const EdgeInsets.all(10.0),
      borderColor: Colors.red[900],
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
              color: Colors.red[900],
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red[900], fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    ).show(navigatorKey.currentState!.overlay!.context);
  }

  static displayGenericError() {
    showErrorToast("Error occurred. Please try again.");
  }

  static displayCustomError(Error error) {
    showErrorToast(error.toString());
  }

  static handleGetAllError<T>() {
    showErrorToast('Error retrieving data. Please try again.');
  }

  static handleGetByIdError<T>() {
    showErrorToast('Error retrieving data. Please try again.');
  }

  static handleAddError<T>(String itemType) {
    showErrorToast('Error adding ${itemType}s. Please try again.');
  }

  static handleCreateRoomError() {
    showErrorToast('Error creating room. Please try again.');
  }

  static handleStartGameError() {
    showErrorToast('Error starting game. Please try again.');
  }

  static handleAddPlayerError() {
    showErrorToast('Error adding player. Please try again.');
  }

  static handleUpdatePlayerError() {
    showErrorToast('Error updating player. Please try again.');
  }

  static handleRemovePlayerError() {
    showErrorToast('Error removing player. Please try again.');
  }

  static handleUpdateError<T>(String itemType) {
    showErrorToast('Error updating ${itemType}s. Please try again.');
  }

  static handleDeleteError<T>(String itemType) {
    showErrorToast('Error deleting ${itemType}s. Please try again.');
  }

  static handleToggleColorModeError() {
    showErrorToast('Error toggling color mode. Please try again.');
  }

  static handleUpdatePlayerScoreError() {
    showErrorToast('Error updating player score. Please try again.');
  }

  static handleEndGameError() {
    showErrorToast('Error ending game. Please try again.');
  }

  static handleToggleCirclePaused() {
    showErrorToast('Error pausing/unpausing circle.');
  }
}
