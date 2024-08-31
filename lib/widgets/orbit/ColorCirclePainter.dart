import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/ColorOrb.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'dart:math';

import 'package:touchable/touchable.dart';

class ColorCirclePainter extends CustomPainter {
  final BuildContext context;
  final Animation<double>? animation;
  final List<ColorOrb> colors;
  final String roomCode;
  final Function(int) onTap;
  final Function onClear;
  final PlayerColor? selectedColor;
  final Player? editPlayer;
  final bool isPaused;

  ColorCirclePainter({
    required this.context,
    this.animation,
    required this.colors,
    required this.roomCode,
    required this.onTap,
    required this.onClear,
    this.editPlayer,
    this.selectedColor,
    required this.isPaused,
  }) : super(repaint: animation);

  Color getFillColor(ColorOrb color) {
    if (color.isTaken) {
      return Colors.black.withOpacity(0);
    }
    if (selectedColor != null && selectedColor!.id == color.color.id || (editPlayer != null && editPlayer!.color.id == color.color.id)) {
      return Colors.black.withOpacity(0.6);
    }
    return color.color.getColorObject();
  }

  Paint getFillPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  TextStyle getTextStyle(double smallCircleRadius) {
    return TextStyle(
        color: CustomColors.offWhite,
        fontSize: smallCircleRadius,
        fontFamily: Icons.clear.fontFamily,
        package: Icons.clear.fontPackage);
  }

  Paint getBorderPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    size = Size(275, 275);
    final canvasSize = Size(350, 350);
    var touchableCanvas = TouchyCanvas(context, canvas);
    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);
    final bigCircleRadius = size.width / 2;
    double smallCircleRadius = size.width / 10;

    final bigCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    touchableCanvas.drawCircle(center, bigCircleRadius, bigCirclePaint);

    if (selectedColor!.id != 0) {
      final textSpan = TextSpan(
        text: String.fromCharCode(Icons.clear.codePoint),
        style: getTextStyle(smallCircleRadius),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout();
      final orbOffset = Offset(canvasSize.width / 2, 5 + (smallCircleRadius * 6));
      final textOffset = Offset(
        orbOffset.dx - textPainter.width / 2,
        orbOffset.dy - textPainter.height / 2,
      );
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        getFillPaint(Colors.black),
        onTapDown: (tapDetail) {
          onClear();
        },
      );
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        getBorderPaint(CustomColors.offWhite),
      );
      textPainter.paint(canvas, textOffset);
    } else {
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
    }

    // Draw
    for (int i = 0; i < colors.length; i++) {
      var color = colors[i];
      double updatedAngle =
          color.angle + (2 * pi * (!isPaused ? animation!.value : 1));
      Offset orbOffset = Offset(
        center.dx + bigCircleRadius * cos(updatedAngle),
        center.dy + bigCircleRadius * sin(updatedAngle),
      );

      final smallCircleBorderPaint = Paint()
        ..color = color.color.getColorObject()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
        
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        getFillPaint(getFillColor(color)),
        onTapDown: (tapDetail) {
          if (!color.isTaken) {
            onTap(i);
          }
        },
      );
      touchableCanvas.drawCircle(
          orbOffset, smallCircleRadius, smallCircleBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
