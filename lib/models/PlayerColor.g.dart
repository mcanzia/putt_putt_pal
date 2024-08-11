// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayerColor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerColorImpl _$$PlayerColorImplFromJson(Map<String, dynamic> json) =>
    _$PlayerColorImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      color: json['color'] as String? ?? '0xff000000',
      textColor: json['textColor'] as String? ?? '0xffffffff',
    );

Map<String, dynamic> _$$PlayerColorImplToJson(_$PlayerColorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'textColor': instance.textColor,
    };
