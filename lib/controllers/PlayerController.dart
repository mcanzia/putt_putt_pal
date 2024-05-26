import 'dart:convert';
import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/CustomError.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:http/http.dart' as http;

class PlayerController {
  PlayerController();

  Future<Map<String, Player>> getPlayers(String roomId) async {
    try {
      RequestParams getRequestParams = RequestUtil.GETRequestParams(roomId);
      final response = await http.get(
        Uri.parse('${RequestUtil.getAPIUrl()}/player'),
        headers: getRequestParams.headers,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      Map<String, dynamic> json = jsonDecode(response.body);
      return json.map((key, value) => MapEntry(key, Player.fromJson(value)));
    } catch (e) {
      rethrow;
    }
  }

  Future<Player> getPlayerById(String roomId, String playerId) async {
    try {
      RequestParams getRequestParams = RequestUtil.GETRequestParams(roomId);
      final response = await http.get(
        Uri.parse('${RequestUtil.getAPIUrl()}/player/$playerId'),
        headers: getRequestParams.headers,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      return Player.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<Player> addPlayer(String roomId, Player player) async {
    try {
      RequestParams postRequestParams =
          RequestUtil.POSTRequestParams(player, roomId);
      final response = await http.post(
        Uri.parse('${RequestUtil.getAPIUrl()}/player'),
        headers: postRequestParams.headers,
        body: postRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      return Player.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePlayer(String roomId, Player player) async {
    try {
      RequestParams putRequestParams =
          RequestUtil.PUTRequestParams(player, roomId);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/player/${player.id}'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removePlayer(String roomId, Player player) async {
    try {
      RequestParams deleteRequestParams =
          RequestUtil.DELETERequestParams(player, roomId);
      final response = await http.delete(
        Uri.parse('${RequestUtil.getAPIUrl()}/player'),
        headers: deleteRequestParams.headers,
        body: deleteRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
