import 'dart:io';

import 'package:putt_putt_pal/models/RequestType.dart';

class RequestParams {

  final RequestType method;
  final Map<String, String>? headers; 
  final String? body;

  RequestParams({required this.method, this.headers, this.body});

}

