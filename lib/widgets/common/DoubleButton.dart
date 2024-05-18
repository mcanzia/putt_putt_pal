import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';
import 'package:putt_putt_pal/widgets/common/BasicIconButton.dart';

class DoubleButton extends StatelessWidget {
  final String buttonOneText;
  final Color buttonOneTextColor;
  final IconData? buttonOneTextIcon;
  final Color buttonOneColor;
  final bool connectedWithInput;
  final VoidCallback buttonOneOnPressed;
  final IconData buttonTwoIcon;
  final Color buttonTwoIconColor;
  final Color buttonTwoColor;
  final VoidCallback buttonTwoOnPressed;
  const DoubleButton(
      {super.key,
      required this.buttonOneText,
      required this.buttonOneTextColor,
      this.buttonOneTextIcon,
      required this.buttonOneColor,
      this.connectedWithInput = false,
      required this.buttonOneOnPressed,
      required this.buttonTwoIcon,
      required this.buttonTwoIconColor,
      required this.buttonTwoColor,
      required this.buttonTwoOnPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: BasicButton(
            text: buttonOneText,
            color: buttonOneColor,
            textColor: buttonOneTextColor,
            onPressed: buttonOneOnPressed,
            connectedWithInput: connectedWithInput,
            doubleButton: true,
            textIcon: buttonOneTextIcon,
          ),
        ),
        Expanded(
          flex: 1,
          child: BasicIconButton(
            icon: buttonTwoIcon,
            color: buttonTwoColor,
            iconColor: buttonTwoIconColor,
            onPressed: buttonTwoOnPressed,
            connectedWithInput: connectedWithInput,
          ),
        ),
      ],
    );
  }
}
