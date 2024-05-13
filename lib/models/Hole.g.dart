// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hole.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HoleImpl _$$HoleImplFromJson(Map<String, dynamic> json) => _$HoleImpl(
      id: json['id'] as String,
      playerScores: (json['playerScores'] as List<dynamic>)
          .map((e) => PlayerScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      holeNumber: (json['holeNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$HoleImplToJson(_$HoleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playerScores': instance.playerScores,
      'holeNumber': instance.holeNumber,
    };
