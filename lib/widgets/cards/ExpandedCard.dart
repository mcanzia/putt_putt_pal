import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({
    super.key,
    required this.content,
    required this.backgroundColor,
    this.maxHeight,
  });

  final Widget content;
  final Color backgroundColor;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: backgroundColor),
      ),
      child: Center(child: content),
    );

    if (maxHeight != null) {
      cardContent = ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight!),
        child: cardContent,
      );
    }

    return Flexible(
      child: cardContent,
    );
    // return cardContent;
  }
}
