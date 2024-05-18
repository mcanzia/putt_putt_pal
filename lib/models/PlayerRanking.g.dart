// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayerRanking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerRankingImpl _$$PlayerRankingImplFromJson(Map<String, dynamic> json) =>
    _$PlayerRankingImpl(
      id: json['id'] as String,
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$PlayerRankingImplToJson(_$PlayerRankingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player': instance.player,
      'score': instance.score,
    };
