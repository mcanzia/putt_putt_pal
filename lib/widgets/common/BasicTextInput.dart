import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicTextInput extends StatelessWidget {
  final String hintText;
  final Color textColor;
  final Color backgroundColor;
  final bool isNumberInput;
  final bool connectedWithButton;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final FocusNode? focusNode;

  const BasicTextInput(
      {super.key,
      required this.hintText,
      required this.textColor,
      required this.backgroundColor,
      this.controller,
      this.maxLength,
      this.isNumberInput = false,
      this.connectedWithButton = false, this.onSubmitted, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          textAlign: TextAlign.center,
          onSubmitted: onSubmitted,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
            border: OutlineInputBorder(
              borderRadius: connectedWithButton
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )
                  : const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: textColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: connectedWithButton
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )
                  : const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: textColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: connectedWithButton
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )
                  : const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: textColor, width: 2),
            ),
            contentPadding: EdgeInsets.all(20),
          ),
          keyboardType:
              isNumberInput ? TextInputType.number : TextInputType.text,
          inputFormatters: [
            if (isNumberInput) FilteringTextInputFormatter.digitsOnly,
            if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
          ]),
    );
  }
}
