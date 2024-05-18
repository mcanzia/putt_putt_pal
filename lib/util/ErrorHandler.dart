import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ErrorHandler {

    static void showErrorToast(String message) {
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
      showErrorToast('Error toggling color mode. Please try again');
    }

    static handleUpdatePlayerScoreError() {
      showErrorToast('Error updating player score. Please try again');
    }
}