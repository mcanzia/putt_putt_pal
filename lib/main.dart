import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/LandingPage.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
