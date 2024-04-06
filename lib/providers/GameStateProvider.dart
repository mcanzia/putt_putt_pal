import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
  (ref) => GameStateNotifier(),
);

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(const GameState());

  void setRandomRoomCode() {
    state = state.copyWith(roomCode: createRandomRoomCode());
  }

  String createRandomRoomCode() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();

    return String.fromCharCodes(
      Iterable.generate(
        4,
        (_) => letters.codeUnitAt(random.nextInt(letters.length)),
      ),
    );
  }

  void startGame(int numberOfHoles) {
    Map<int, Hole> newHoles = {};

    for (int i = 1; i <= numberOfHoles; i++) {
      Map<int, PlayerScore> playerScores = {};

      for (var player in state.players) {
        playerScores[player.playerNumber] =
            PlayerScore(player: player, score: 0);
      }

      newHoles[i] = Hole(
        holeNumber: i,
        playerScores: playerScores,
      );
    }

    state = state.copyWith(holes: newHoles, numberOfHoles: numberOfHoles);
  }

  void resetState() {
    state = state.copyWith(
        holes: {},
        players: [],
        allPlayersJoined: true,
        numberOfHoles: 1,
        roomCode: '');
  }

  void resetGameSamePlayers() {
    state = state.copyWith(
        holes: {},
        allPlayersJoined: true,
        numberOfHoles: 1,
        roomCode: createRandomRoomCode());
  }

  void updatePlayerScore(int holeNumber, int playerNumber, int newScore) {
    var holeToUpdate = state.holes[holeNumber];

    Map<int, PlayerScore> updatedPlayerScores =
        Map.from(holeToUpdate!.playerScores);
    updatedPlayerScores[playerNumber] = PlayerScore(
        player: updatedPlayerScores[playerNumber]!.player, score: newScore);

    Map<int, Hole> updatedHoles = Map.from(state.holes);
    updatedHoles[holeNumber] =
        holeToUpdate.copyWith(playerScores: updatedPlayerScores);

    state = state.copyWith(holes: updatedHoles);
  }

  void addPlayer(Player player) {
    state = state.copyWith(
      players: [...state.players, player],
    );
  }

  void removePlayer(int playerNumber) {
    state = state.copyWith(
        players: state.players
            .where((player) => player.playerNumber != playerNumber)
            .toList());
  }

  void setAllPlayersJoined(bool joined) {
    state = state.copyWith(allPlayersJoined: joined);
  }

  void setNumberOfHoles(int holes) {
    state = state.copyWith(numberOfHoles: holes);
  }
}
