import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/GuestOrb.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'dart:math';

import 'package:touchable/touchable.dart';

class GuestCirclePainter extends CustomPainter {
  final BuildContext context;
  final Animation<double>? animation;
  final List<GuestOrb> guests;
  final String roomCode;
  final Player? editPlayer;
  final Player? currentUser;
  final Function(Player) onTap;
  final bool isPaused;

  GuestCirclePainter({
    required this.context,
    this.animation,
    required this.guests,
    required this.roomCode,
    required this.onTap,
    this.currentUser,
    this.editPlayer,
    required this.isPaused,
  }) : super(repaint: animation);

  Color getPlayerColor(Player? player) {
    if (editPlayer != null) {
      return player!.id == editPlayer!.id
          ? player.getPlayerBackgroundColor()
          : player.getPlayerBackgroundColor().withOpacity(0.5);
    }
    return player!.getPlayerBackgroundColor();
  }

  String getPlayerName(Player? player) {
    if (editPlayer != null) {
      return player!.id == editPlayer!.id
          ? String.fromCharCode(Icons.person_remove.codePoint)
          : player.getFirstInitial();
    }
    return player!.getFirstInitial();
  }

  TextStyle getTextStyle(Player? player, double smallCircleRadius) {
    if (editPlayer != null) {
      return TextStyle(
          color: player!.getPlayerTextColor(),
          fontSize: smallCircleRadius * 0.9,
          fontFamily: Icons.person_remove.fontFamily,
          package: Icons.person_remove.fontPackage);
    }
    return TextStyle(
      color: player!.getPlayerTextColor(),
      fontSize: smallCircleRadius * 0.9,
      fontWeight: FontWeight.bold,
    );
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
      double updatedAngle = guest.angle + (2 * pi * (!isPaused ? animation!.value : 1));
      Offset orbOffset = Offset(
        center.dx + bigCircleRadius * cos(updatedAngle),
        center.dy + bigCircleRadius * sin(updatedAngle),
      );
      final smallCircleFillPaint = Paint()
        ..color = getPlayerColor(guest.player)
        ..style = PaintingStyle.fill;
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        smallCircleFillPaint,
        onTapDown: (tapDetail) {
            if (currentUser!.isHost) {
              onTap(guest.player!);
            }
        },
      );
      touchableCanvas.drawCircle(
          orbOffset, smallCircleRadius, smallCircleBorderPaint);

      final textSpan = TextSpan(
        text: getPlayerName(guest.player),
        style: getTextStyle(guest.player, smallCircleRadius),
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
