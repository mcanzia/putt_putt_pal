import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';

part 'GameState.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default({}) Map<int, Hole> holes,
    @Default([]) List<Player> players,
    @Default(false) bool allPlayersJoined,
    @Default(1) int numberOfHoles,
  }) = _GameState;
}

extension GameStateExtension on GameState {
  int getPlayerScore(int holeNumber, int playerNumber) {

    if (!holes.containsKey(holeNumber)) {
      return 0;
    }

    final playerScore = holes[holeNumber]?.playerScores[playerNumber];

    return playerScore != null ? playerScore.score : 0;
  }

  List<PlayerScore> getRankings() {
    final Map<int, int> cumulativeScores = {};

    holes.forEach((holeNumber, hole) {
      hole.playerScores.forEach((playerNumber, playerScore) {
        if (!cumulativeScores.containsKey(playerNumber)) {
          cumulativeScores[playerNumber] = playerScore.score;
        } else {
          cumulativeScores[playerNumber] = cumulativeScores[playerNumber]! + playerScore.score;
        }
      });
    });

    final List<PlayerScore> rankings = cumulativeScores.entries.map((entry) {
      final player = players.firstWhere((p) => p.playerNumber == entry.key);
      return PlayerScore(player: player, score: entry.value);
    }).toList();

    rankings.sort((a, b) => a.score.compareTo(b.score));

    return rankings;
  }
}
