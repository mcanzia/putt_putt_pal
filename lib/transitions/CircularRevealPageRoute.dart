import 'dart:math';

import 'package:flutter/material.dart';
import 'package:putt_putt_pal/transitions/CircularRevealClipper.dart';

class CircularRevealTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const CircularRevealTransition({
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final size = MediaQuery.of(context).size;
        final center = Offset(size.width / 2, size.height / 2);
        final radiusTween = Tween<double>(
          begin: 0.0,
          end: max(size.width, size.height) * 1.2,
        );
        return ClipPath(
          clipper: CircularRevealClipper(radiusTween.evaluate(animation), center),
          child: child,
        );
      },
      child: child,
    );
  }
}