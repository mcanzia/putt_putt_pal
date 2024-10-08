import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/PlayerRanking.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/models/Room.dart';

part 'GameState.freezed.dart';
part 'GameState.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(Room()) Room room,
    @Default(null) Player? editPlayer,
    @Default(null) Player? currentUser,
    @Default(false) bool colorPickerMode,
    @Default(false) bool circlePaused,
    @Default(PlayerColor()) PlayerColor currentColor,
    @Default([]) List<PlayerColor> playerColors,
    @Default("/") String currentRoute
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);  
}

extension GameStateExtension on GameState {
  int getPlayerScore(Hole hole, Player player) {
    PlayerScore playerScore = hole.playerScores
        .firstWhere((playerScore) => playerScore.playerId == player.id);
    return playerScore.score;
  }

  List<int> getTakenColors() {
    List<int> takenColors = [];

    for (Player player in room.players.values) {
      takenColors.add(player.color.id);
    }
    return takenColors;
  }

  List<PlayerRanking> getRankings() {
    final Map<String, int> cumulativeScores = {};

    for (Hole hole in room.holes.values) {
      for (PlayerScore playerScore in hole.playerScores) {
        String playerId = playerScore.playerId;
        if (!cumulativeScores.containsKey(playerId)) {
          cumulativeScores[playerId] = playerScore.score;
        } else {
          cumulativeScores[playerId] =
              cumulativeScores[playerId]! + playerScore.score;
        }
      }
    }

    final List<PlayerRanking> rankings = cumulativeScores.entries.map((entry) {
      final player = room.players[entry.key];
      return PlayerRanking(id: '', player: player!, score: entry.value);
    }).toList();

    rankings.sort((a, b) => a.score.compareTo(b.score));

    return rankings;
  }
}
