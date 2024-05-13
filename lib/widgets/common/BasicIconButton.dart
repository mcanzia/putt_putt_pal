import 'package:flutter/material.dart';

class BasicIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color color;
  final bool connectedWithInput;
  final VoidCallback onPressed;

  const BasicIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onPressed,
    this.connectedWithInput = false,
  });

  @override
  Widget build(BuildContext context) {
    final BorderSide borderSide = BorderSide(color: iconColor, width: 2.0);
    final BoxDecoration boxDecoration = BoxDecoration(
      color: color,
      border: Border(
        bottom: borderSide,
        left: borderSide,
        right: borderSide,
        top: connectedWithInput ? BorderSide.none : borderSide,
      ),
      borderRadius: connectedWithInput
          ? const BorderRadius.only(
              bottomRight: Radius.circular(50),
            )
          : const BorderRadius.all(Radius.circular(50)),
    );
    return Container(
      decoration: boxDecoration,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          elevation: MaterialStateProperty.all(0),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 41,
        ),
      ),
    );
  }
}
