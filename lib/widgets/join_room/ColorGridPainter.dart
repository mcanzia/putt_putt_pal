import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:touchable/touchable.dart';

class ColorGridPainter extends CustomPainter {
  final BuildContext context;
  final List<PlayerColor> colors;
  final PlayerColor? selectedColor;
  final Function(int) onTap;
  final Function onClear;

  ColorGridPainter({
    required this.context,
    required this.colors,
    this.selectedColor,
    required this.onTap,
    required this.onClear,
  }) : super();

  Color getFillColor(PlayerColor color) {
    if (selectedColor != null && selectedColor!.id == color.id) {
      return color.getColorObject().withOpacity(0.3);
    }
    return color.getColorObject();
  }

  TextStyle getTextStyle(double smallCircleRadius) {
    return TextStyle(
        color: CustomColors.offWhite,
        fontSize: smallCircleRadius,
        fontFamily: Icons.clear.fontFamily,
        package: Icons.clear.fontPackage);
  }

  Paint getFillPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  Paint getBorderPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var touchableCanvas = TouchyCanvas(context, canvas);
    const int columns = 4;
    const double padding = 17.0;
    final double smallCircleRadius = (size.width / columns - padding) / 2;

    final double totalGridWidth =
        columns * (2 * smallCircleRadius + padding) - padding;
    final double horizontalOffset = (size.width - totalGridWidth) / 2;

    for (int i = 0; i < colors.length; i++) {
      int row = i ~/ columns;
      int column = i % columns;

      final Offset orbOffset = Offset(
        horizontalOffset +
            column * (2 * smallCircleRadius + padding) +
            smallCircleRadius,
        padding + row * (2 * smallCircleRadius + padding),
      );

      var color = colors[i];

      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        getFillPaint(getFillColor(color)),
        onTapDown: (tapDetail) {
          onTap(i);
        },
      );
      touchableCanvas.drawCircle(
        orbOffset,
        smallCircleRadius,
        getBorderPaint(color.getColorObject()),
      );
    }
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
      final orbOffset =
          Offset(size.width / 2, padding * 5 + (smallCircleRadius * 5));
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
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
