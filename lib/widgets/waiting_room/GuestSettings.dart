import 'package:flutter/material.dart';

class GuestSettings extends StatelessWidget {
  const GuestSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Waiting For Host to Start',
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 40,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
