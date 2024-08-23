// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GameState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      room: json['room'] == null
          ? const Room()
          : Room.fromJson(json['room'] as Map<String, dynamic>),
      editPlayer: json['editPlayer'] == null
          ? null
          : Player.fromJson(json['editPlayer'] as Map<String, dynamic>),
      currentUser: json['currentUser'] == null
          ? null
          : Player.fromJson(json['currentUser'] as Map<String, dynamic>),
      colorPickerMode: json['colorPickerMode'] as bool? ?? false,
      circlePaused: json['circlePaused'] as bool? ?? false,
      currentColor: json['currentColor'] == null
          ? const PlayerColor()
          : PlayerColor.fromJson(json['currentColor'] as Map<String, dynamic>),
      playerColors: (json['playerColors'] as List<dynamic>?)
              ?.map((e) => PlayerColor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentRoute: json['currentRoute'] as String? ?? "/",
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'room': instance.room,
      'editPlayer': instance.editPlayer,
      'currentUser': instance.currentUser,
      'colorPickerMode': instance.colorPickerMode,
      'circlePaused': instance.circlePaused,
      'currentColor': instance.currentColor,
      'playerColors': instance.playerColors,
      'currentRoute': instance.currentRoute,
    };
