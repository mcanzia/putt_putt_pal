import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Player.dart';

part 'PlayerScore.freezed.dart';

@freezed
class PlayerScore with _$PlayerScore {
  const factory PlayerScore({
    required Player player,
    required int score,
  }) = _PlayerScore;
}