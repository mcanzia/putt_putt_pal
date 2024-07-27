import 'package:flutter/material.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';

class ExpandedCardLink extends StatelessWidget {
  const ExpandedCardLink(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      this.toPage,
      this.onPressed});

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final String? toPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onPressed != null
              ? onPressed!()
              : RouterHelper.handleRouteChangeWithBack(toPage!);
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
