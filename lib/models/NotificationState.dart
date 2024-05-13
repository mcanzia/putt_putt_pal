import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/CustomNotification.dart';

part 'NotificationState.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(null) CustomNotification? errorMessage,
    @Default(null) CustomNotification? successMessage,
  }) = _NotificationState;
}