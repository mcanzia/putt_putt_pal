import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final bool connectedWithInput;
  final bool doubleButton;
  final VoidCallback onPressed;
  const BasicButton(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onPressed,
      this.connectedWithInput = false,
      this.doubleButton = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: connectedWithInput
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: doubleButton ? Radius.circular(0) : Radius.circular(50),
                  )
                : const BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: color),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 30, color: textColor, fontFamily: 'Lobster'),
      ),
    );
  }
}
