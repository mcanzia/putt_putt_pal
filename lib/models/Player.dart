import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/styles/colors.dart';

part 'Player.freezed.dart'; 
part 'Player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    @Default('') String id,
    @Default('') String name,
    @Default(false) bool isHost,
    @Default(PlayerColor()) PlayerColor color,
  }) = _Player;

  const Player._();

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Color getPlayerTextColor() {
    return color.getTextColorObject();
  }

  Color getPlayerBackgroundColor() {
    return color.getColorObject();
  }

  String getFirstInitial() {
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }

}
