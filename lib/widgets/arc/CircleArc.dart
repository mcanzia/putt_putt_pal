import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/arc/CircleArcPainter.dart';

class CircleArc extends StatelessWidget {
  const CircleArc({super.key, required this.radius, required this.startAngle, this.text});

  final double radius;
  final double startAngle;
  final String? text;
  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: CircleArcPainter(
          radius,
          startAngle,
        ),
        size: Size(radius,radius)
      );
  
}