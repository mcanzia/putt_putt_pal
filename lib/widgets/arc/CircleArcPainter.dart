import 'package:flutter/material.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'dart:math';

class CircleArcPainter extends CustomPainter {
  CircleArcPainter(this.radius, this.startAngle) : super();

  final double radius;
  final double startAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final bigCircleRadius = size.width / 4;
    double smallCircleRadius = size.width / 20;
    final orbitRadius = bigCircleRadius + size.width / 10;

    for (int i = 0; i < 12; i++) {
      final angle = startAngle + (i * pi / 6);
      final smallCircleX = center.dx + orbitRadius * cos(angle);
      final smallCircleY = center.dy + orbitRadius * sin(angle);
      Color circleColor;
      // debugPrint('angle: ${angle}');
      if (angle >= 0 && angle < (pi / 2)) {
        circleColor = CustomColors.offWhite;
      } else if (angle >= (pi / 2) && angle <= pi) {
        circleColor = CustomColors.offWhite;
      } else if (angle > pi && angle < (3 * pi / 2)) {
        circleColor = Colors.black;
      } else {
        circleColor = Colors.black;
      }

      // Draw the orbiting small circle
      canvas.drawCircle(Offset(smallCircleX, smallCircleY), smallCircleRadius,
          Paint()..color = circleColor);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
