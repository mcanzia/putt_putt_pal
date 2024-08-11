import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/styles/colors.dart';

part 'PlayerColor.freezed.dart'; 
part 'PlayerColor.g.dart';

@freezed
class PlayerColor with _$PlayerColor {
  const factory PlayerColor({
    @Default(0) int id,
    @Default('0xff000000') String color,
    @Default('0xffffffff') String textColor,
  }) = _PlayerColor;

  const PlayerColor._();

  factory PlayerColor.fromJson(Map<String, dynamic> json) => _$PlayerColorFromJson(json);

  Color getColorObject() {
    return Color(int.parse(color));
  }

  Color getTextColorObject() {
    return Color(int.parse(textColor));
  }

}
