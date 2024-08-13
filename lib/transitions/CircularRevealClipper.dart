import 'package:flutter/material.dart';
import 'dart:math';

class CircularRevealClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  CircularRevealClipper(this.radius, this.center);

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) {
    return radius != oldClipper.radius || center != oldClipper.center;
  }
}
