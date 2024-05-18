import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:putt_putt_pal/models/Room.dart';

class RoomController {

  RoomController();

  Future<List<Room>> getRooms() async {
    try {
      final response = await http.get(Uri.parse('${RequestUtil.getAPIUrl()}/room'));
      if (response.statusCode == 200) {
        print('Rooms: ${response.body}');
        Iterable json = jsonDecode(response.body);
        return List<Room>.from(json.map((model) => Room.fromJson(model)));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Room> getRoomByNumber(String roomNumber) async {
    try {
      final response = await http.get(Uri.parse('${RequestUtil.getAPIUrl()}/room/$roomNumber'));
      if (response.statusCode == 200) {
        print('Room: ${response.body}');
        return Room.fromJson(jsonDecode(response.body));
      } else {
        throw Error();
      }
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
      if (response.statusCode == 200) {
        print('Room created: ${response.body}');
        return Room.fromJson(jsonDecode(response.body));
      } else {
        throw Error();
      }
    } catch (e, stackTrace) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Room> startGame(String roomId, Room updatedRoom) async {
    try {
      RequestParams putRequestParams = RequestUtil.PUTRequestParams(updatedRoom, null);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/startGame/$roomId'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode == 200) {
        print('Game Started: ${response.body}');
        return Room.fromJson(jsonDecode(response.body));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Room> updateRoom(String roomId, Room updatedRoom) async {
    try {
      RequestParams putRequestParams = RequestUtil.PUTRequestParams(updatedRoom, null);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/$roomId'),
        headers: putRequestParams.headers,
        body: putRequestParams.body,
      );
      if (response.statusCode == 200) {
        print('Room updated: ${response.body}');
        return Room.fromJson(jsonDecode(response.body));
      } else {
        throw Error();
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
      if (response.statusCode == 200) {
        print('Room deleted');
        return;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Room> joinRoom(String roomCode, String playerName, bool isHost) async {
    try {
      RequestParams postRequestParams = RequestUtil.POSTRequestParams({'playerName': playerName, 'roomCode': roomCode, 'isHost': isHost}, null);
      final response = await http.post(
        Uri.parse('${RequestUtil.getAPIUrl()}/room/join'),
        headers: postRequestParams.headers,
        body: postRequestParams.body,
      );
      if (response.statusCode == 200) {
        print('Joined room: ${response.body}');
        return Room.fromJson(jsonDecode(response.body));
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
