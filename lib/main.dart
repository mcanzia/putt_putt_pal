import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GoRouterProvider.dart';
import 'package:putt_putt_pal/util/LoggerUtil.dart';
import 'pages/LandingPage.dart';
import 'package:putt_putt_pal/router.dart';

void main() {
  LoggerUtil.info('Application started');
  runApp(
    const ProviderScope(
      child: PuttPuttPal(),
    ),
  );
}

class PuttPuttPal extends ConsumerWidget {
  const PuttPuttPal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
