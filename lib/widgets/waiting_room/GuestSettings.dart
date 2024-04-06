import 'package:flutter/material.dart';

class GuestSettings extends StatelessWidget {
  const GuestSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Waiting For Host to Start',
      style: TextStyle(
        fontFamily: 'Lobster',
        fontSize: 40,
        color: Colors.black,
      ),
    );
  }
}
