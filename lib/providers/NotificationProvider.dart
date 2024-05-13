import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/CustomNotification.dart';
import 'package:putt_putt_pal/models/NotificationState.dart';
import 'package:putt_putt_pal/models/NotificationType.dart';

final notificationProvider = StateNotifierProvider<NotificationNotifier, NotificationState>(
  (ref) => NotificationNotifier(),
);

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier() : super(const NotificationState());


  void setMessage(String message, NotificationType type) {
            if (type == NotificationType.success) {
                if (state.successMessage == null) {
                    CustomNotification newSuccessMessage = CustomNotification(message: message, type: type.toString());
                    state = state.copyWith(successMessage: newSuccessMessage);
                }
            } else {
                if (state.errorMessage == null) {
                    CustomNotification newErrorMessage = CustomNotification(message: message, type: type.toString());
                    state = state.copyWith(errorMessage: newErrorMessage);
                }
            }
        }

  void resetMessage() {
    state = state.copyWith(errorMessage: null, successMessage: null);
  }

}
