import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Player.dart';

part 'PlayerScore.freezed.dart';
part 'PlayerScore.g.dart';

@freezed
class PlayerScore with _$PlayerScore {
  const factory PlayerScore({
    required String id,
    required Player player,
    required int score,
  }) = _PlayerScore;

  factory PlayerScore.fromJson(Map<String, dynamic> json) => _$PlayerScoreFromJson(json);
}