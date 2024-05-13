import 'dart:convert';
import 'dart:io';

import 'package:putt_putt_pal/models/RequestParams.dart';
import 'package:putt_putt_pal/models/RequestType.dart';

class RequestUtil {

  static String getAPIUrl() {
        return 'http://localhost:7500/api';
   }

   static GETRequestParams(String? roomToken) {
        String bearer = 'Bearer $roomToken';
        return RequestParams(method: RequestType.get, headers: {
          'Authorization': bearer
        });
    }

    static POSTRequestParams(body, String? roomToken) {
        String bearer = 'Bearer $roomToken';
        return RequestParams(method: RequestType.post, headers: {
          'Content-Type': 'application/json',
          'Authorization': bearer,
        }, body: jsonEncode(body));
    }

    static PUTRequestParams(body, String? roomToken) {
        String bearer = 'Bearer $roomToken';
        return RequestParams(method: RequestType.put, headers: {
          'Content-Type': 'application/json',
          'Authorization': bearer,
        }, body: jsonEncode(body));
    }

    static DELETERequestParams(body, String? roomToken) {
        String bearer = 'Bearer $roomToken';
        return RequestParams(method: RequestType.delete, headers: {
          'Content-Type': 'application/json',
          'Authorization': bearer,
        }, body: jsonEncode(body));
    }

}
