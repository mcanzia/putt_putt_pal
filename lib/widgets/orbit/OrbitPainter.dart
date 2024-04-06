import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/OrbitTrail.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'dart:math';

class OrbitPainter extends CustomPainter {
  final Animation<double>? animation;
  final List<OrbitTrail> trailPositions = [];
  final int trailLength = 3;
  double lastAngle = 0.0; // Keep track of the last angle
  final double minDistance = 40; // Minimum distance between trail circles

  OrbitPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final bigCircleRadius = size.width / 4;
    double smallCircleRadius = size.width / 20;
    final orbitRadius = bigCircleRadius + size.width / 10; // Distance from center to the orbiting circle
  
    // Calculate the position of the smaller orbiting circle
    final angle = 2 * pi * animation!.value; // animation.value goes from 0.0 to 1.0
    final smallCircleX = center.dx + orbitRadius * cos(angle);
    final smallCircleY = center.dy + orbitRadius * sin(angle);
    final currentSmallCirclePosition = Offset(smallCircleX, smallCircleY);

    Color circleColor;
    // debugPrint('angle: ${angle}');
    if (angle >= 0 && angle < (pi / 2)) {
      circleColor = CustomColors.offWhite;
      smallCircleRadius = smallCircleRadius * cos(angle);
    } else if (angle >= (pi / 2) && angle <= pi) {
      circleColor = CustomColors.offWhite;
      smallCircleRadius = smallCircleRadius * cos(angle - pi);
    } else if (angle > pi && angle < (3* pi / 2)) {
      circleColor = Colors.black;
      smallCircleRadius = smallCircleRadius * cos(angle - pi);
    } else {
      circleColor = Colors.black;
      smallCircleRadius = smallCircleRadius * cos(angle);
    }

    // Only update trail positions if the new position is sufficiently far from the last
    if (trailPositions.isEmpty || (lastAngle - angle).abs() >= minDistance / orbitRadius) {
      if (trailPositions.length >= trailLength) {
        trailPositions.removeAt(0); // Remove the oldest position if trail is at max length
      }
      OrbitTrail orbitTrail = OrbitTrail(offset: currentSmallCirclePosition, color: circleColor, radius: smallCircleRadius);
      trailPositions.add(orbitTrail); // Add current position
      lastAngle = angle; // Update the last angle
    }

    // Draw the trail
    for (int i = 0; i < trailPositions.length; i++) {
      final opacity = (i + 1) / trailPositions.length; // Gradually increase opacity
      canvas.drawCircle(trailPositions[i].offset, trailPositions[i].radius, Paint()..color = trailPositions[i].color.withOpacity(opacity));
    }

    // Draw the orbiting small circle
    canvas.drawCircle(Offset(smallCircleX, smallCircleY), smallCircleRadius, Paint()..color = circleColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
