// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isHost: json['isHost'] as bool? ?? false,
      color: json['color'] == null
          ? const PlayerColor()
          : PlayerColor.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isHost': instance.isHost,
      'color': instance.color,
    };
