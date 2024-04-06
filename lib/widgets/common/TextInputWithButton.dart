import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';
import 'package:putt_putt_pal/widgets/common/BasicTextInput.dart';
import 'package:putt_putt_pal/widgets/common/UpperCaseTextField.dart';

class TextInputWithButton extends StatefulWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final String textFieldHintText;
  final Color textFieldTextColor;
  final Color textFieldBackgroundColor;
  final bool textFieldBasic;
  final bool isNumberInput;
  final int? textFieldMaxLength;
  final Widget? toPage;
  final Function(String text)? onButtonPressed;
  final FocusNode? focusNode;

  const TextInputWithButton({
    Key? key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.textFieldHintText,
    required this.textFieldTextColor,
    required this.textFieldBackgroundColor,
    this.textFieldBasic = true,
    this.isNumberInput = false,
    this.textFieldMaxLength,
    this.toPage,
    this.onButtonPressed, this.focusNode,
  }) : super(key: key);

  @override
  State<TextInputWithButton> createState() => _TextInputWithButtonState();
}

class _TextInputWithButtonState extends State<TextInputWithButton> {
  final TextEditingController _textFieldController = TextEditingController();

  void _buttonReturnValueEvent() {
    if (widget.onButtonPressed != null &&
        _textFieldController.text.isNotEmpty) {
      widget.onButtonPressed!(_textFieldController.text);
      _textFieldController.text = '';
    }
  }

  void _buttonGoToPage() {
    if (widget.toPage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.toPage!),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
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
                  controller: _textFieldController,
                  hintText: widget.textFieldHintText,
                  textColor: widget.textFieldTextColor,
                  backgroundColor: widget.textFieldBackgroundColor,
                  maxLength: widget.textFieldMaxLength,
                  isNumberInput: widget.isNumberInput,
                  connectedWithButton: true,
                  onSubmitted: (value) {
                    _buttonReturnValueEvent();
                    _buttonGoToPage();
                  })
              : UppercaseTextField(
                  controller: _textFieldController,
                  hintText: widget.textFieldHintText,
                  textColor: widget.textFieldTextColor,
                  backgroundColor: widget.textFieldBackgroundColor,
                  maxLength: widget.textFieldMaxLength,
                  connectedWithButton: true,
                  onSubmitted: (value) {
                    _buttonReturnValueEvent();
                    _buttonGoToPage();
                  },
                ),
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
          child: BasicButton(
            text: widget.buttonText,
            textColor: widget.buttonTextColor,
            color: widget.buttonColor,
            connectedWithInput: true,
            onPressed: () {
              _buttonReturnValueEvent();
              _buttonGoToPage();
            },
          ),
        ),
      ],
    );
  }
}
