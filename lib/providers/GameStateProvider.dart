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

  Future<void> createRoom(WidgetRef ref) async {
    try {
      Room newRoom = await roomController.createRoom();
      state = state.copyWith(room: newRoom);
    } catch (error) {
      ErrorHandler.handleCreateRoomError(ref, error);
    }
  }

  Future<void> startGame(WidgetRef ref, Room room, int numberOfHoles) async {
    try {
      Room startDetails = Room(
        id: room.id,
        roomCode: room.roomCode,
        players: room.players,
        holes: room.holes,
        allPlayersJoined: room.allPlayersJoined,
        numberOfHoles: numberOfHoles,
        playerColors: room.playerColors,
      );
      Room updatedRoom = await roomController.startGame(room.id, startDetails);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleStartGameError(ref, error);
    }
  }

  Future<void> resetState(WidgetRef ref, Room room) async {
    try {
      Room resetRoom = await roomController.updateRoom(room.id, const Room());

      state = state.copyWith(room: resetRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'room', room, error);
    }
  }

  Future<void> resetGameSamePlayers(WidgetRef ref, Room room) async {
    try {
      Room updatedRoom = Room(
        id: room.id,
        roomCode: room.roomCode,
        holes: {},
        players: room.players,
        numberOfHoles: 1,
        allPlayersJoined: true,
        playerColors: room.playerColors,
      );
      Room resetRoom = await roomController.updateRoom(room.id, updatedRoom);
      state = state.copyWith(room: resetRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'room', room, error);
    }
  }

  Future<void> setAllPlayersJoined(
      WidgetRef ref, Room room, bool joined) async {
    try {
      Room roomDetails = Room(
        id: room.id,
        roomCode: room.roomCode,
        holes: room.holes,
        players: room.players,
        numberOfHoles: room.numberOfHoles,
        allPlayersJoined: joined,
        playerColors: room.playerColors,
      );
      Room updatedRoom = await roomController.updateRoom(room.id, roomDetails);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'room', room, error);
    }
  }

  Future<void> setNumberOfHoles(WidgetRef ref, Room room, int holes) async {
    try {
      Room roomDetails = Room(
        id: room.id,
        holes: room.holes,
        players: room.players,
        numberOfHoles: holes,
        allPlayersJoined: room.allPlayersJoined,
        playerColors: room.playerColors,
      );
      Room updatedRoom = await roomController.updateRoom(room.id, roomDetails);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'room', room, error);
    }
  }

  Future<void> updatePlayerScore(
      Hole holeToUpdate, int playerNumber, int newScore) async {
    if (holeToUpdate != null) {
      List<PlayerScore> updatedPlayerScores =
          holeToUpdate.playerScores.map((playerScore) {
        if (playerScore.player.playerNumber == playerNumber) {
          return PlayerScore(
              id: playerScore.id, player: playerScore.player, score: newScore);
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
  }

  Future<void> joinRoom(
      WidgetRef ref, String roomCode, String playerName) async {
    try {
      Room updatedRoom =
          await roomController.joinRoom(roomCode, playerName, false);
      state = state.copyWith(room: updatedRoom, currentColor: PlayerColor());
    } catch (error) {
      ErrorHandler.handleAddPlayerError(ref, error);
    }
  }

  Future<void> addPlayerToRoom(WidgetRef ref, Room room, String playerName,
      bool isHost, PlayerColor color) async {
    try {
      if (state.room.players.length >= 12) {
        throw Error();
      }
      Player newPlayer = Player(
          id: '',
          name: playerName,
          playerNumber: room.players.length + 1,
          isHost: isHost,
          color: color);
      List<Player> updatedPlayers =
          await playerController.addPlayer(room.id, newPlayer);
      Room updatedRoom = room.copyWith(players: updatedPlayers);
      state = state.copyWith(room: updatedRoom, currentColor: PlayerColor());
    } catch (error) {
      ErrorHandler.handleAddPlayerError(ref, error);
    }
  }

  Future<void> removePlayerFromRoom(
      WidgetRef ref, Room room, Player player) async {
    try {
      List<Player> updatedPlayers =
          await playerController.removePlayer(room.id, player.id);
      Room updatedRoom = room.copyWith(players: updatedPlayers);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleRemovePlayerError(ref, error);
    }
  }

  void toggleEditPlayer(WidgetRef ref, Player? player) {
    try {
      state = state.copyWith(editPlayer: player);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'editPlayer', state.room, error);
    }
  }

  Future<void> editPlayer(WidgetRef ref, Room room, Player player) async {
    try {
      List<Player> updatedPlayers =
          await playerController.updatePlayer(room.id, player);

      Room updatedRoom = room.copyWith(players: updatedPlayers);
      state = state.copyWith(room: updatedRoom);
    } catch (error) {
      ErrorHandler.handleUpdatePlayerError(ref, error);
    }
  }

  void toggleColorMode(WidgetRef ref) {
    try {
      state = state.copyWith(colorPickerMode: !state.colorPickerMode);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'toggleColorMode', state.room, error);
    }
  }

  void setColorMode(WidgetRef ref, bool updatedColorMode) {
    try {
      state = state.copyWith(colorPickerMode: updatedColorMode);
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'setColorMode', state.room, error);
    }
  }

  void setPlayerColor(WidgetRef ref, PlayerColor color) {
    try {
      if (state.editPlayer != null) {
        Player updatedEditPlayer = Player(
          id: state.editPlayer!.id,
          name: state.editPlayer!.name,
          color: color,
          playerNumber: state.editPlayer!.playerNumber,
          isHost: state.editPlayer!.isHost,
        );
        state =
            state.copyWith(editPlayer: updatedEditPlayer, currentColor: color);
      } else {
        state = state.copyWith(currentColor: color);
      }
    } catch (error) {
      ErrorHandler.handleUpdateError(ref, 'setPlayerColor', state.room, error);
    }
  }
}
