import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key, required this.backgroundColor, required this.textColor, required this.text});

  final Color backgroundColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.topCenter,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 40,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
