import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Player.dart';

part 'PlayerRanking.freezed.dart';
part 'PlayerRanking.g.dart';

@freezed
class PlayerRanking with _$PlayerRanking {
  const factory PlayerRanking({
    required String id,
    required Player player,
    required int score,
  }) = _PlayerRanking;

  factory PlayerRanking.fromJson(Map<String, dynamic> json) => _$PlayerRankingFromJson(json);
}