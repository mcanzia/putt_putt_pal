import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';
import 'package:putt_putt_pal/widgets/common/BasicTextInput.dart';
import 'package:putt_putt_pal/widgets/common/DoubleButton.dart';
import 'package:putt_putt_pal/widgets/common/UpperCaseTextField.dart';

class TextInputWithDoubleButton extends StatefulWidget {
  final String buttonOneText;
  final Color buttonOneTextColor;
  final Color buttonOneColor;
  final IconData buttonTwoIcon;
  final Color buttonTwoIconColor;
  final Color buttonTwoColor;
  final String textFieldHintText;
  final Color textFieldTextColor;
  final Color textFieldBackgroundColor;
  final Color textFieldBorderColor;
  final bool textFieldBasic;
  final bool isNumberInput;
  final TextEditingController controller;
  final int? textFieldMaxLength;
  final Widget? toPageOne;
  final Widget? toPageTwo;
  final Function(String text)? onButtonOnePressed;
  final VoidCallback? onButtonTwoPressed;
  final FocusNode? focusNode;

  const TextInputWithDoubleButton({
    Key? key,
    required this.buttonOneText,
    required this.buttonOneTextColor,
    required this.buttonOneColor,
    required this.buttonTwoIcon,
    required this.buttonTwoIconColor,
    required this.buttonTwoColor,
    required this.textFieldHintText,
    required this.textFieldTextColor,
    required this.textFieldBackgroundColor,
    required this.textFieldBorderColor,
    required this.controller,
    this.textFieldBasic = true,
    this.isNumberInput = false,
    this.textFieldMaxLength,
    this.toPageOne,
    this.toPageTwo,
    this.onButtonOnePressed,
    this.onButtonTwoPressed,
    this.focusNode,
  }) : super(key: key);

  @override
  State<TextInputWithDoubleButton> createState() =>
      _TextInputWithDoubleButtonState();
}

class _TextInputWithDoubleButtonState extends State<TextInputWithDoubleButton> {
  void _buttonOneReturnValueEvent() {
    if (widget.onButtonOnePressed != null &&
        widget.controller.text.isNotEmpty) {
      widget.onButtonOnePressed!(widget.controller.text);
      // widget.controller.text = '';
    }
  }

  void _buttonOneGoToPage() {
    if (widget.toPageOne != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.toPageOne!),
      );
    }
  }

  void _buttonTwoReturnValueEvent() {
    if (widget.onButtonTwoPressed != null) {
      widget.onButtonTwoPressed!();
    }
  }

  void _buttonTwoGoToPage() {
    if (widget.toPageTwo != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.toPageTwo!),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.4;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
          child: widget.textFieldBasic
              ? BasicTextInput(
                  controller: widget.controller,
                  hintText: widget.textFieldHintText,
                  textColor: widget.textFieldTextColor,
                  backgroundColor: widget.textFieldBackgroundColor,
                  borderColor: widget.textFieldBorderColor,
                  maxLength: widget.textFieldMaxLength,
                  isNumberInput: widget.isNumberInput,
                  connectedWithButton: true,
                  onSubmitted: (value) {
                    _buttonOneReturnValueEvent();
                    _buttonOneGoToPage();
                  })
              : UppercaseTextField(
                  controller: widget.controller,
                  hintText: widget.textFieldHintText,
                  textColor: widget.textFieldTextColor,
                  backgroundColor: widget.textFieldBackgroundColor,
                  borderColor: widget.textFieldBorderColor,
                  maxLength: widget.textFieldMaxLength,
                  connectedWithButton: true,
                  onSubmitted: (value) {
                    _buttonOneReturnValueEvent();
                    _buttonOneGoToPage();
                  },
                ),
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
          child: DoubleButton(
            buttonOneText: widget.buttonOneText,
            buttonOneTextColor: widget.buttonOneTextColor,
            buttonOneColor: widget.buttonOneColor,
            buttonOneOnPressed: () {
              _buttonOneReturnValueEvent();
              _buttonOneGoToPage();
            },
            connectedWithInput: true,
            buttonTwoIcon: widget.buttonTwoIcon,
            buttonTwoColor: widget.buttonTwoColor,
            buttonTwoIconColor: widget.buttonTwoIconColor,
            buttonTwoOnPressed: () {
              _buttonTwoReturnValueEvent();
              _buttonTwoGoToPage();
            },
          ),
        ),
      ],
    );
  }
}
