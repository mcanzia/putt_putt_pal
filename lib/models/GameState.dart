import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/models/Room.dart';

part 'GameState.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(Room()) Room room,
    @Default(null) Player? editPlayer,
    @Default(false) bool colorPickerMode,
    @Default(PlayerColor()) PlayerColor currentColor,
  }) = _GameState;
}

extension GameStateExtension on GameState {
  int getPlayerScore(Hole hole, int playerNumber) {
    PlayerScore playerScore = hole.playerScores.firstWhere(
        (playerScore) => playerScore.player.playerNumber == playerNumber);
    return playerScore.score;
  }

  List<PlayerColor> getTakenColors() {
    List<PlayerColor> takenColors = [];

    for (Player player in room.players) {
      takenColors.add(player.color);
    }
    return takenColors;
  }

  List<PlayerScore> getRankings() {
    final Map<int, int> cumulativeScores = {};

    for (Hole hole in room.holes.values) {
      for (PlayerScore playerScore in hole.playerScores) {
        int playerNumber = playerScore.player.playerNumber;
        if (!cumulativeScores.containsKey(playerNumber)) {
          cumulativeScores[playerNumber] = playerScore.score;
        } else {
          cumulativeScores[playerNumber] =
              cumulativeScores[playerNumber]! + playerScore.score;
        }
      }
    }

    final List<PlayerScore> rankings = cumulativeScores.entries.map((entry) {
      final player =
          room.players.firstWhere((p) => p.playerNumber == entry.key);
      return PlayerScore(id: '', player: player, score: entry.value);
    }).toList();

    rankings.sort((a, b) => a.score.compareTo(b.score));

    return rankings;
  }


}
