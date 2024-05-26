import 'package:flutter/material.dart';
import 'package:putt_putt_pal/main.dart';

class RouterHelper {

  static void handleRouteChange(Widget target) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => target),
      (Route<dynamic> route) => false,
    );
  }

  static void handleRouteChangeWithBack(Widget target) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => target));
  }
}