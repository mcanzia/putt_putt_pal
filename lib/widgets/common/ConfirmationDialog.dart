import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationDialog extends ConsumerWidget {
  const ConfirmationDialog(this.bodyText, this.confirmAction, this.cancelAction,
      {super.key});

  final String bodyText;
  final VoidCallback confirmAction;
  final VoidCallback cancelAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: Text(
        bodyText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            confirmAction();
          },
          child: const Text("Yes"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {
            cancelAction();
          },
          child: const Text("No"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.black, width: 2.0),
          ),
        ),
      ],
    );
  }
}
