import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/ColorOrb.dart';
import 'package:putt_putt_pal/models/GuestOrb.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'dart:math';

import 'package:touchable/touchable.dart';

class ColorCirclePainter extends CustomPainter {
  final BuildContext context;
  final Animation<double>? animation;
  final List<ColorOrb> colors;
  final String roomCode;
  final Function(int, bool) onTap;

  ColorCirclePainter({
    required this.context,
    this.animation,
    required this.colors,
    required this.roomCode,
    required this.onTap,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var touchableCanvas = TouchyCanvas(context, canvas);
    final center = Offset(size.width / 2, size.height / 2);
    final bigCircleRadius = size.width / 2;
    double smallCircleRadius = size.width / 15;

    final bigCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    touchableCanvas.drawCircle(center, bigCircleRadius, bigCirclePaint);

    const roomCodeTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontWeight: FontWeight.bold,
    );
    final roomCodeTextSpan = TextSpan(
      text: roomCode,
      style: roomCodeTextStyle,
    );
    final roomCodeTextPainter = TextPainter(
      text: roomCodeTextSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    roomCodeTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final roomCodeTextOffset = Offset(
      center.dx - roomCodeTextPainter.width / 2,
      center.dy - roomCodeTextPainter.height / 2,
    );
    roomCodeTextPainter.paint(canvas, roomCodeTextOffset);

    final smallCircleBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw
    for (int i = 0; i < colors.length; i++) {
      var color = colors[i];
      double updatedAngle = color.angle + (2 * pi * animation!.value);
      Offset orbOffset = Offset(
        center.dx + bigCircleRadius * cos(updatedAngle),
        center.dy + bigCircleRadius * sin(updatedAngle),
      );
      final smallCircleFillPaint = Paint()
        ..color = color.isTaken ? color.color.withOpacity(0.1) : color.color
        ..style = PaintingStyle.fill;
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        smallCircleFillPaint,
        onTapDown: (tapDetail) {
          onTap(i, color.isTaken);
        },
      );
      touchableCanvas.drawCircle(
          orbOffset, smallCircleRadius, smallCircleBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
