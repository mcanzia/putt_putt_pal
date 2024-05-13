// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayerScore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerScoreImpl _$$PlayerScoreImplFromJson(Map<String, dynamic> json) =>
    _$PlayerScoreImpl(
      id: json['id'] as String,
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$PlayerScoreImplToJson(_$PlayerScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player': instance.player,
      'score': instance.score,
    };
