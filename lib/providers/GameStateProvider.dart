import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/controllers/HoleController.dart';
import 'package:putt_putt_pal/controllers/RoomController.dart';
import 'package:putt_putt_pal/controllers/PlayerController.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/util/ErrorHandler.dart';
import 'package:putt_putt_pal/util/ExceptionHandler.dart';

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
  (ref) => GameStateNotifier(
      roomController: RoomController(),
      playerController: PlayerController(),
      holeController: HoleController()),
);

class GameStateNotifier extends StateNotifier<GameState> {
  final RoomController roomController;
  final PlayerController playerController;
  final HoleController holeController;

  GameStateNotifier(
      {required this.roomController,
      required this.playerController,
      required this.holeController})
      : super(const GameState());

  Future<void> createRoom() async {
    try {
      Room newRoom = await roomController.createRoom();
      state = state.copyWith(room: newRoom);
    } catch (error) {
      ErrorHandler.handleCreateRoomError();
    }
  }

  Future<void> startGame(int numberOfHoles) async {
    try {
      toggleEditPlayer(null);
      Room startDetails = Room(
        id: state.room.id,
        roomCode: state.room.roomCode,
        players: state.room.players,
        holes: state.room.holes,
        allPlayersJoined: state.room.allPlayersJoined,
        numberOfHoles: numberOfHoles,
        playerColors: state.room.playerColors,
      );
      Room updatedRoom = await roomController.startGame(state.room.id, startDetails);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleStartGameError();
    }
  }

  Future<void> resetState() async {
    try {
      Room resetRoom = await roomController.updateRoom(state.room.id, const Room());

      state = state.copyWith(room: resetRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> resetGameSamePlayers() async {
    try {
      Room updatedRoom = Room(
        id: state.room.id,
        roomCode: state.room.roomCode,
        holes: {},
        players: state.room.players,
        numberOfHoles: 1,
        allPlayersJoined: true,
        playerColors: state.room.playerColors,
      );
      Room resetRoom = await roomController.updateRoom(state.room.id, updatedRoom);
      state = state.copyWith(room: resetRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> setAllPlayersJoined(bool joined) async {
    try {
      toggleEditPlayer(null);
      Room roomDetails = Room(
        id: state.room.id,
        roomCode: state.room.roomCode,
        holes: state.room.holes,
        players: state.room.players,
        numberOfHoles: state.room.numberOfHoles,
        allPlayersJoined: joined,
        playerColors: state.room.playerColors,
      );
      Room updatedRoom = await roomController.updateRoom(state.room.id, roomDetails);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      print(error.toString());
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> setNumberOfHoles(int holes) async {
    try {
      Room roomDetails = Room(
        id: state.room.id,
        holes: state.room.holes,
        players: state.room.players,
        numberOfHoles: holes,
        allPlayersJoined: state.room.allPlayersJoined,
        playerColors: state.room.playerColors,
      );
      Room updatedRoom = await roomController.updateRoom(state.room.id, roomDetails);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> updatePlayerScore(
      Hole holeToUpdate, Player player, int newScore) async {
    try {
      if (holeToUpdate != null) {
        List<PlayerScore> updatedPlayerScores =
            holeToUpdate.playerScores.map((playerScore) {
          if (playerScore.playerId == player.id) {
            return PlayerScore(
                id: playerScore.id,
                playerId: playerScore.playerId,
                score: newScore);
          }
          return playerScore;
        }).toList();

        Hole updatedHole = Hole(
            id: holeToUpdate.id,
            holeNumber: holeToUpdate.holeNumber,
            playerScores: updatedPlayerScores);

        Map<String, Hole> updatedHoles =
            await holeController.updateHole(state.room.id, updatedHole);

        state = state.copyWith(room: state.room.copyWith(holes: updatedHoles));
      }
    } catch (error) {
      ErrorHandler.handleUpdatePlayerScoreError();
    }
  }

  Future<void> joinRoom(String roomCode, String playerName) async {
    try {
      Room updatedRoom =
          await roomController.joinRoom(roomCode, playerName, false);
      state = state.copyWith(room: updatedRoom, currentColor: PlayerColor());
    } catch (error) {
      ErrorHandler.handleAddPlayerError();
    }
  }

  Future<void> addPlayerToRoom(
      String playerName, bool isHost, PlayerColor color) async {
    try {
      if (state.room.players.length >= 12) {
        throw Error();
      }
      Player newPlayer =
          Player(id: '', name: playerName, isHost: isHost, color: color);
      Map<String, Player> updatedPlayers =
          await playerController.addPlayer(state.room.id, newPlayer);
      Room updatedRoom = state.room.copyWith(players: updatedPlayers);
      state = state.copyWith(room: updatedRoom, currentColor: PlayerColor(), colorPickerMode: false);
    } catch (error) {
      ErrorHandler.handleAddPlayerError();
    }
  }

  Future<void> removePlayerFromRoom(Player player) async {
    try {
      if (state.room.players.length > 1) {
        Map<String, Player> updatedPlayers =
            await playerController.removePlayer(state.room.id, player);
        Room updatedRoom = state.room.copyWith(players: updatedPlayers);
        state = state.copyWith(room: updatedRoom);
        toggleEditPlayer(null);
      } else {
        ExceptionHandler.handleDeleteLastPlayerException();
      }
    } catch (error) {
      ErrorHandler.handleRemovePlayerError();
    }
  }

  void toggleEditPlayer(Player? player) {
    try {
      state = state.copyWith(editPlayer: player);
      setColorMode(false);
    } catch (error) {
      ErrorHandler.handleUpdatePlayerError();
    }
  }

  Future<void> editPlayer(Player player) async {
    try {
      Map<String, Player> updatedPlayers =
          await playerController.updatePlayer(state.room.id, player);

      Room updatedRoom = state.room.copyWith(players: updatedPlayers);
      state = state.copyWith(room: updatedRoom);
      toggleEditPlayer(null);
      setPlayerColor(PlayerColor());
    } catch (error) {
      ErrorHandler.handleUpdatePlayerError();
    }
  }

  void toggleColorMode() {
    try {
      state = state.copyWith(colorPickerMode: !state.colorPickerMode);
    } catch (error) {
      ErrorHandler.handleToggleColorModeError();
    }
  }

  void setColorMode(bool updatedColorMode) {
    try {
      state = state.copyWith(colorPickerMode: updatedColorMode);
    } catch (error) {
      ErrorHandler.handleToggleColorModeError();
    }
  }

  void setPlayerColor(PlayerColor color) {
    try {
      if (state.editPlayer != null) {
        Player updatedEditPlayer = Player(
          id: state.editPlayer!.id,
          name: state.editPlayer!.name,
          color: color,
          isHost: state.editPlayer!.isHost,
        );
        state =
            state.copyWith(editPlayer: updatedEditPlayer, currentColor: color);
      } else {
        state = state.copyWith(currentColor: color);
      }
    } catch (error) {
      ErrorHandler.handleUpdatePlayerError();
    }
  }
}
