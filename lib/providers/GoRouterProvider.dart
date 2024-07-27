import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:putt_putt_pal/router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return router;
});