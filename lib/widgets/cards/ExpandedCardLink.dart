import 'package:flutter/material.dart';

class ExpandedCardLink extends StatelessWidget {
  const ExpandedCardLink(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backgroundColor, required this.toPage});

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Widget toPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toPage),
          );
        },
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 40,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
