import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';

part 'Hole.freezed.dart';
part 'Hole.g.dart';

@freezed
class Hole with _$Hole {
  const factory Hole({
    required String id,
    required List<PlayerScore> playerScores,
    required int holeNumber,
  }) = _Hole;

  const Hole._();

  factory Hole.fromJson(Map<String, dynamic> json) => _$HoleFromJson(json);
}