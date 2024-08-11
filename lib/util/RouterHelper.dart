import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/main.dart';
import 'package:go_router/go_router.dart';
import 'package:putt_putt_pal/providers/GoRouterProvider.dart';

class RouterHelper {

  static final ProviderContainer _container = ProviderContainer();

  static void handleRouteChange(String route) {
    final goRouter = _container.read(goRouterProvider);
    print('ROUTE: ' + route);
    goRouter.go(route);
  }

  static void handleRouteChangeWithBack(String route) {
    final goRouter = _container.read(goRouterProvider);
    print('ROUTE WITH BACK: ' + route);
    goRouter.go(route);
  }

  static void handleScorePageChange(int index) {
    final goRouter = _container.read(goRouterProvider);
    print('SCORE PAGE ROUTE: NUMBER  + ${index}');
    goRouter.go(Uri(path: '/scoring/${index}').toString());

  }

  // static void handleRouteChange(Widget target) {
  //   navigatorKey.currentState?.pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) => target),
  //     (Route<dynamic> route) => false,
  //   );
  // }

  // static void handleRouteChangeWithBack(Widget target) {
  //   navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => target));
  // }
}