import 'dart:convert';
import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/CustomError.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:http/http.dart' as http;

class HoleController {
  HoleController();

  Future<Map<String, Hole>> getHoles(String roomId) async {
    try {
      RequestParams getRequestParams = RequestUtil.GETRequestParams(roomId);
      final response = await http.get(
        Uri.parse('${RequestUtil.getAPIUrl()}/hole'),
        headers: getRequestParams.headers,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      Map<String, dynamic> json = jsonDecode(response.body);
      return json.map((key, value) => MapEntry(key, Hole.fromJson(value)));
    } catch (e) {
      rethrow;
    }
  }

  Future<Hole> getHoleById(String roomId, String holeId) async {
    try {
      RequestParams getRequestParams = RequestUtil.GETRequestParams(roomId);
      final response = await http.get(
        Uri.parse('${RequestUtil.getAPIUrl()}/hole/$holeId'),
        headers: getRequestParams.headers,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      return Hole.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, Hole>> addHole(String roomId, Hole hole) async {
    try {
      RequestParams postRequestParams =
          RequestUtil.POSTRequestParams(hole, roomId);
      final response = await http.post(
        Uri.parse('${RequestUtil.getAPIUrl()}/hole'),
        headers: postRequestParams.headers,
        body: postRequestParams.body,
      );
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      Map<String, dynamic> json = jsonDecode(response.body);
      return json.map((key, value) => MapEntry(key, Hole.fromJson(value)));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateHole(String roomId, Hole hole) async {
    try {
      RequestParams putRequestParams =
          RequestUtil.PUTRequestParams(hole, roomId);
      final response = await http.put(
        Uri.parse('${RequestUtil.getAPIUrl()}/hole/${hole.id}'),
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

  Future<Map<String, Hole>> removeHole(String roomId, Hole hole) async {
    try {
      RequestParams deleteRequestParams =
          RequestUtil.DELETERequestParams(hole, roomId);
      final response = await http.delete(
          Uri.parse('${RequestUtil.getAPIUrl()}/hole'),
          headers: deleteRequestParams.headers,
          body: deleteRequestParams.body);
      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      Map<String, dynamic> json = jsonDecode(response.body);
      return json.map((key, value) => MapEntry(key, Hole.fromJson(value)));
    } catch (e) {
      rethrow;
    }
  }
}
