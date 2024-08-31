// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['id'] as String? ?? '',
      roomCode: json['roomCode'] as String? ?? '',
      players: (json['players'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Player.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      holes: (json['holes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Hole.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      allPlayersJoined: json['allPlayersJoined'] as bool? ?? false,
      numberOfHoles: (json['numberOfHoles'] as num?)?.toInt() ?? 1,
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomCode': instance.roomCode,
      'players': instance.players,
      'holes': instance.holes,
      'allPlayersJoined': instance.allPlayersJoined,
      'numberOfHoles': instance.numberOfHoles,
      'isFinished': instance.isFinished,
    };
