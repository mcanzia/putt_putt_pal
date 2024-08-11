import 'dart:ui';

class CustomError extends Error {
  final String message;
  final int statusCode;

  CustomError({required this.message, required this.statusCode});

  @override
  String toString() {
    return message;
  }

}

class RoomNotFoundError extends CustomError {
  RoomNotFoundError({required super.message, required super.statusCode});
}

class DuplicateColorError extends CustomError {
  DuplicateColorError({required super.message, required super.statusCode});
}

class DuplicateNameError extends CustomError {
  DuplicateNameError({required super.message, required super.statusCode});
}