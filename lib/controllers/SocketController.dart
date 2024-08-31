import 'dart:convert';

import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/CustomError.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:http/http.dart' as http;
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/util/LoggerUtil.dart';

class SocketController {
  SocketController();

  Future<GameState?> checkSocketConnectionStatus(String socketId) async {
    try {
      RequestParams postRequestParams =
          RequestUtil.POSTRequestParams({'socketId': socketId}, null);
      final response = await http.post(
          Uri.parse('${RequestUtil.getAPIUrl()}/socket/checkConnection'),
          headers: postRequestParams.headers,
          body: postRequestParams.body);
      final jsonResponse = jsonDecode(response.body);
      print('Connected to socket -- $jsonResponse');
      bool isConnected = jsonResponse['connected'];
      if (isConnected) {
        Room room = Room.fromJson(jsonResponse['room']);
        if (room != null) {
          Player player = Player.fromJson(jsonResponse['player']);
          List<PlayerColor> playerColors = List<PlayerColor>.from(jsonResponse['playerColors'].map((model) => PlayerColor.fromJson(model)));
          GameState previousGameState = new GameState(room: room, currentUser: player, playerColors: playerColors);
          return previousGameState;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
