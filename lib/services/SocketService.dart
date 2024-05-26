import 'package:flutter/material.dart';
import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService extends ChangeNotifier {
  late IO.Socket _socket;
  final String _baseUrl = RequestUtil.getAPIHost();

  SocketService() {
    _initSocket();
  }

  void _initSocket() {
    _socket = IO.io(_baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket.connect();

    _socket.on('connect', (_) {
      print('Connected to socket server');
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from socket server');
    });

    // _socket.onAny((event, data) {
    //   print('Event: $event, Data: $data');
    // });

  }

  void emit(String event, Map<String, dynamic> data) {
    _socket.emit(event, data);
  }

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, (data) {
      callback(data);
    });
  }

  void joinRoom(String roomId) {
    emit('joinRoom', {
        'roomId': roomId,
      });
  }

  @override
  void dispose() {
    _socket.dispose();
    super.dispose();
  }
}
