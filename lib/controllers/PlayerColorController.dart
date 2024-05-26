import 'dart:convert';

import 'package:putt_putt_pal/controllers/RequestUtil.dart';
import 'package:putt_putt_pal/models/CustomError.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:http/http.dart' as http;

class PlayerColorController {

  PlayerColorController();
  
  Future<List<PlayerColor>> getPlayerColors() async {
    try {
      RequestParams getRequestParams = RequestUtil.GETRequestParams(null);
      final response = await http.get(
        Uri.parse('${RequestUtil.getAPIUrl()}/playerColor'),
        headers: getRequestParams.headers,
      );

      if (response.statusCode != 200) {
        throw CustomError(
            message: response.body, statusCode: response.statusCode);
      }
      Iterable json = jsonDecode(response.body);
        return List<PlayerColor>.from(json.map((model) => PlayerColor.fromJson(model)));
    } catch (e) {
      rethrow;
    }
  }
}