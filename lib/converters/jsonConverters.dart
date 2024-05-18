import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Player.dart';

class PlayerMapConverter implements JsonConverter<Map<String, Player>, Map<String, dynamic>> {
  const PlayerMapConverter();

  @override
  Map<String, Player> fromJson(Map<String, dynamic> json) {
    return json.map((key, value) => MapEntry(key, Player.fromJson(value as Map<String, dynamic>)));
  }

  @override
  Map<String, dynamic> toJson(Map<String, Player> object) {
    return object.map((key, value) => MapEntry(key, value.toJson()));
  }
}
