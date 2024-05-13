import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:putt_putt_pal/models/NotificationType.dart";
import "package:putt_putt_pal/models/RequestType.dart";
import "package:putt_putt_pal/providers/NotificationProvider.dart";

class ErrorHandler {

    static displayGenericError() {
        print("Error occurred. Please try again.");
    }
    
    static handleGetAllError<T>(WidgetRef ref, String itemType, Error error) {
        ref.read(notificationProvider.notifier).setMessage('Error retrieving data. Please try again.', NotificationType.error);
    }

    static handleGetByIdError<T>(WidgetRef ref, String itemType, String itemId, Error error) {
        ref.read(notificationProvider.notifier).setMessage('Error retrieving data. Please try again.', NotificationType.error);
    }

    static handleAddError<T>(WidgetRef ref, String itemType, List<T> itemsToAdd, Error error) {
        ref.read(notificationProvider.notifier).setMessage('Error adding ${itemType}s. Please try again.', NotificationType.error);
    }

    static handleCreateRoomError(WidgetRef ref, Object error) {
      ref.read(notificationProvider.notifier).setMessage('Error creating room. Please try again.', NotificationType.error);
      print(error.toString());
    }

    static handleStartGameError(WidgetRef ref, Object error) {
      ref.read(notificationProvider.notifier).setMessage('Error starting game. Please try again.', NotificationType.error);
      print(error.toString());
    }

    static handleAddPlayerError(WidgetRef ref, Object error) {
      ref.read(notificationProvider.notifier).setMessage('Error adding player. Please try again.', NotificationType.error);
      print(error.toString());
    }

    static handleUpdatePlayerError(WidgetRef ref, Object error) {
      ref.read(notificationProvider.notifier).setMessage('Error updating player. Please try again.', NotificationType.error);
      print(error.toString());
    }

    static handleRemovePlayerError(WidgetRef ref, Object error) {
      ref.read(notificationProvider.notifier).setMessage('Error removing player. Please try again.', NotificationType.error);
      print(error.toString());
    }

    static handleUpdateError<T>(WidgetRef ref, String itemType, T itemToUpdate, Object error) {
        ref.read(notificationProvider.notifier).setMessage('Error updating ${itemType}s. Please try again.', NotificationType.error);
        print(error.toString());
    }

    static handleDeleteError<T>(WidgetRef ref, String itemType, List<T> itemsToDelete, Error error) {
        ref.read(notificationProvider.notifier).setMessage('Error deleting ${itemType}s. Please try again.', NotificationType.error);
    }
}