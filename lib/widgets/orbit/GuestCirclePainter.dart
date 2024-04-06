import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/GuestOrb.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'dart:math';

import 'package:touchable/touchable.dart';

class GuestCirclePainter extends CustomPainter {
  final BuildContext context;
  final Animation<double>? animation;
  final List<GuestOrb> guests;
  final String roomCode;
  final Function(int) onTap;

  GuestCirclePainter({
    required this.context,
    this.animation,
    required this.guests,
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
    for (int i = 0; i < guests.length; i++) {
      var guest = guests[i];
      double updatedAngle = guest.angle + (2 * pi * animation!.value);
      Offset orbOffset = Offset(
        center.dx + bigCircleRadius * cos(updatedAngle),
        center.dy + bigCircleRadius * sin(updatedAngle),
      );
      final smallCircleFillPaint = Paint()
        ..color = guest.occupied ? Colors.black : CustomColors.offWhite
        ..style = PaintingStyle.fill;
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        smallCircleFillPaint,
        onTapDown: (tapDetail) {
          onTap(i);
        },
      );
      touchableCanvas.drawCircle(
          orbOffset, smallCircleRadius, smallCircleBorderPaint);

      final textStyle = TextStyle(
        color: guest.occupied ? CustomColors.offWhite : Colors.black,
        fontSize: smallCircleRadius * 0.9,
        fontWeight: FontWeight.bold,
      );
      final textSpan = TextSpan(
        text: guest.occupied ? guest.name : '+',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout();
      final textOffset = Offset(
        orbOffset.dx - textPainter.width / 2,
        orbOffset.dy - textPainter.height / 2,
      );
      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
