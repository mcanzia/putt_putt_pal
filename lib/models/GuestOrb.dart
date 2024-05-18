import 'dart:ui';

import 'package:putt_putt_pal/models/Player.dart';

class GuestOrb {
  final double angle;
  final bool occupied;
  final Player? player;

  GuestOrb({this.player, required this.angle, required this.occupied});

}