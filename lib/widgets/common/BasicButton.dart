import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final IconData? textIcon;
  final Color textColor;
  final Color color;
  final bool connectedWithInput;
  final bool doubleButton;
  final VoidCallback onPressed;
  const BasicButton(
      {super.key,
      required this.text,
      this.textIcon,
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
        backgroundColor: WidgetStateProperty.all(color),
        padding: WidgetStateProperty.all(const EdgeInsets.all(21)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (textIcon != null)
            Icon(
              textIcon,
              color: textColor,
            ),
          if (textIcon != null)
            const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 30,
              color: textColor,
              fontFamily: 'Lobster',
            ),
          ),
        ],
      ),
    );
  }
}
