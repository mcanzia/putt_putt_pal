import 'dart:convert';
import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:http/http.dart' as http;

class PlayerController {

  PlayerController();

  Future<List<Player>> getPlayers(String roomId) async {
    try {
      RequestParams getRequestParams = RequestUtil.GETRequestParams(roomId);
      final response = await http.get(
        Uri.parse('${RequestUtil.getAPIUrl()}/player'),
        headers: getRequestParams.headers,
      );
      if (response.statusCode == 200) {
        print('Get players: ${response.body}');
        Iterable json = jsonDecode(response.body);
        return List<Player>.from(json.map((model) => Player.fromJson(model)));
      } else {
        throw Error();
      }
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
      if (response.statusCode == 200) {
        print('Get player: ${response.body}');
        return Player.fromJson(jsonDecode(response.body));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Player>> addPlayer(String roomId, Player player) async {
    try {
      RequestParams postRequestParams = RequestUtil.POSTRequestParams(player, roomId);
      final response = await http.post(
        Uri.parse('${RequestUtil.getAPIUrl()}/player'),
        headers: postRequestParams.headers,
        body: postRequestParams.body,
      );
      if (response.statusCode == 200) {
        print('Joined room: ${response.body}');
        Iterable json = jsonDecode(response.body);
        return List<Player>.from(json.map((model) => Player.fromJson(model)));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Player>> updatePlayer(String roomId, Player player) async {
    try {
      RequestParams putRequestParams =
          RequestUtil.PUTRequestParams(player, roomId);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/player/${player.id}'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode == 200) {
        print('Updated player: ${response.body}');
        Iterable json = jsonDecode(response.body);
        return List<Player>.from(json.map((model) => Player.fromJson(model)));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Player>> removePlayer(String roomId, String playerName) async {
    try {
      RequestParams postRequestParams = RequestUtil.DELETERequestParams({'playerName': playerName}, roomId);
      final response = await http.delete(
        Uri.parse('${RequestUtil.getAPIUrl()}/player'),
        headers: postRequestParams.headers,
        body: postRequestParams.body
      );
      if (response.statusCode == 200) {
        print('Left room: ${response.body}');
        Iterable json = jsonDecode(response.body);
        return List<Player>.from(json.map((model) => Player.fromJson(model)));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

}