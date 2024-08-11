import 'dart:ui';

import 'package:putt_putt_pal/models/PlayerColor.dart';

class ColorOrb {
  final double angle;
  final PlayerColor color;
  final bool isTaken;

  ColorOrb({required this.angle, required this.color, this.isTaken = false});

}