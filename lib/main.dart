import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/LandingPage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    const ProviderScope(
      child: PuttPuttPal(),
    ),
  );
}

class PuttPuttPal extends StatelessWidget {
  const PuttPuttPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const LandingPage(),
    );
  }
}
