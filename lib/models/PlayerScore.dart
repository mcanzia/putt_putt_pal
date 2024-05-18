import 'package:freezed_annotation/freezed_annotation.dart';

part 'PlayerScore.freezed.dart';
part 'PlayerScore.g.dart';

@freezed
class PlayerScore with _$PlayerScore {
  const factory PlayerScore({
    required String id,
    required String playerId,
    required int score,
  }) = _PlayerScore;

  factory PlayerScore.fromJson(Map<String, dynamic> json) => _$PlayerScoreFromJson(json);
}