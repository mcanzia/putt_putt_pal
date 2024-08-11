import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/CustomError.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:putt_putt_pal/models/Room.dart';

class RoomController {

  RoomController();

  Future<List<Room>> getRooms() async {
    try {
      final response = await http.get(Uri.parse('${RequestUtil.getAPIUrl()}/room'));
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
      Iterable json = jsonDecode(response.body);
      return List<Room>.from(json.map((model) => Room.fromJson(model)));
    } catch (e) {
      rethrow;
    }
  }

  Future<Room> getRoomByNumber(String roomNumber) async {
    try {
      final response = await http.get(Uri.parse('${RequestUtil.getAPIUrl()}/room/$roomNumber'));
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
      return Room.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<Room> createRoom() async {
    try {
      RequestParams postRequestParams = RequestUtil.POSTRequestParams({}, null);
      final response = await http.post(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/create'),
        headers: postRequestParams.headers,
        body: postRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
      return Room.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> startGame(String roomId, Room updatedRoom) async {
    try {
      RequestParams putRequestParams = RequestUtil.PUTRequestParams(updatedRoom, null);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/startGame/$roomId'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetRoom(String roomId, Room resetRoomDetails) async {
    try {
      RequestParams putRequestParams = RequestUtil.PUTRequestParams(resetRoomDetails, null);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/reset/$roomId'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateRoom(String roomId, Room updatedRoom) async {
    try {
      RequestParams putRequestParams = RequestUtil.PUTRequestParams(updatedRoom, null);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/$roomId'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteRoom(String roomId) async {
    try {
      RequestParams deleteRequestParams = RequestUtil.DELETERequestParams({}, null);
      final response = await http.delete(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/$roomId'),
        headers: deleteRequestParams.headers,
      );
      if (response.statusCode != 200) {
        throw CustomError(message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Room> joinRoom(String roomCode, String playerName, bool isHost, PlayerColor color) async {
    try {
      RequestParams postRequestParams = RequestUtil.POSTRequestParams({'playerName': playerName, 'roomCode': roomCode, 'isHost': isHost, 'color': color}, null);
      final response = await http.post(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/join'),
        headers: postRequestParams.headers,
        body: postRequestParams.body,
      );
      switch(response.statusCode) {
        case 200: {
          return Room.fromJson(jsonDecode(response.body));
        }
        case 404: {
          throw RoomNotFoundError(message: response.body, statusCode: response.statusCode);
        }
        case 303: {
          throw DuplicateNameError(message: response.body, statusCode: response.statusCode);
        }
        case 313: {
          throw DuplicateColorError(message: response.body, statusCode: response.statusCode);
        }
        default: {
          throw CustomError(message: response.body, statusCode: response.statusCode);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
