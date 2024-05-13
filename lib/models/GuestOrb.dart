import 'dart:ui';

class GuestOrb {
  final double angle;
  final bool occupied;
  final String? name;
  final bool? isHost;
  final Color? color;
  final Color? textColor;

  GuestOrb({this.name, this.isHost, this.color, this.textColor, required this.angle, required this.occupied});

}