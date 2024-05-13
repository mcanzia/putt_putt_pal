// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      playerNumber: (json['playerNumber'] as num?)?.toInt() ?? 1,
      isHost: json['isHost'] as bool? ?? false,
      color: json['color'] == null
          ? const PlayerColor()
          : PlayerColor.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'playerNumber': instance.playerNumber,
      'isHost': instance.isHost,
      'color': instance.color,
    };
