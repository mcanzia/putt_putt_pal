import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UppercaseTextField extends StatefulWidget {
  final String hintText;
  final Color textColor;
  final Color backgroundColor;
  final bool connectedWithButton;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;

  const UppercaseTextField({
    super.key,
    required this.hintText,
    required this.textColor,
    required this.backgroundColor,
    this.maxLength,
    this.connectedWithButton = false,
    this.controller, this.onSubmitted, this.focusNode,
  });

  @override
  State<UppercaseTextField> createState() => _UppercaseTextFieldState();
}

class _UppercaseTextFieldState extends State<UppercaseTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(() {
      final text = _controller.text.toUpperCase();
      if (text != _controller.text) {
        _controller.value = _controller.value.copyWith(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
          composing: TextRange.empty,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        autofocus: true,
        textAlign: TextAlign.center,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(
          fontSize: 30,
          color: widget.textColor,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.textColor.withOpacity(0.5)),
          border: OutlineInputBorder(
            borderRadius: widget.connectedWithButton
                ? const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                : const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: widget.textColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.connectedWithButton
                ? const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                : const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: widget.textColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.connectedWithButton
                ? const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                : const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: widget.textColor, width: 2),
          ),
          contentPadding: const EdgeInsets.all(20),
        ),
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          if (widget.maxLength != null)
            LengthLimitingTextInputFormatter(widget.maxLength)
        ],
      ),
    );
  }
}
