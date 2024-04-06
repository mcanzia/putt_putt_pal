import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';

part 'Hole.freezed.dart';

@freezed
class Hole with _$Hole {
  const factory Hole({
    required Map<int, PlayerScore> playerScores,
    required int holeNumber,
  }) = _Hole;
}