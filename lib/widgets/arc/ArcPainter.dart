import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import 'dart:math';

class ArcPainter extends CustomPainter {
  ArcPainter(this.radius, this.startAngle, this.text) : super();

  final double radius;
  final double startAngle;
  final String? text;

  final textPainter = TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.translate(0, -radius);

    if (startAngle != 0) {
      final d = 2 * radius * sin(startAngle / 2);
      final rotationAngle = calculateRotationAngle(0, startAngle);
      canvas.rotate(rotationAngle);
      canvas.translate(d, 0);
    }

      double angle = startAngle;

      for (int i = 0; i < 10; i++) {
        // angle = drawText(canvas, text[i], angle);
        angle = drawCircle(canvas, angle, i);
      }
  }

  double drawCircle(Canvas canvas, double prevAngle, num index) {

    const double d = 47;
    final double alpha = 2 * asin(d / (2 * radius));
    final newAngle = calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);
    final double angleFromStart = alpha * index;

    Color circleColor;
    double circleRadius;
    if (angleFromStart >= 0 && angleFromStart < (pi / 2)) {
      circleColor = Colors.black;
      circleRadius = 2.0 * (6 - index);
    } else if (angleFromStart >= (pi / 2) && angleFromStart <= pi) {
      circleColor = CustomColors.offWhite;
      circleRadius = 2.0 * (4 + (index % 3));
    } else if (angleFromStart > pi && angleFromStart < 3*(pi / 2)) {
      circleColor = CustomColors.offWhite;
      circleRadius = 2.0 * (6 - (index % 3));
    } else {
      circleColor = Colors.black;
      circleRadius = 2.0 * (4 + (index % 3));
    }

      canvas.drawCircle(Offset.zero, circleRadius, Paint()..style=PaintingStyle.fill..color=circleColor);
    

    canvas.translate(d, 0);
    return alpha;
  }

  double drawText(Canvas canvas, String letter, double prevAngle) {
    textPainter.text = TextSpan(text: letter);
    textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );

    final double d = textPainter.width;
    final double alpha = 2 * asin(d / (2 * radius));

    final newAngle = calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);
    textPainter.paint(canvas, Offset(0, -textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double calculateRotationAngle(double prevAngle, double alpha) {
    return (alpha + prevAngle) / 2;
  }
    
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
