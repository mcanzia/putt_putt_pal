import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/controllers/HoleController.dart';
import 'package:putt_putt_pal/controllers/PlayerColorController.dart';
import 'package:putt_putt_pal/controllers/RoomController.dart';
import 'package:putt_putt_pal/controllers/PlayerController.dart';
import 'package:putt_putt_pal/models/CustomError.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/pages/FinalScorePage.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/services/SocketService.dart';
import 'package:putt_putt_pal/util/ErrorHandler.dart';
import 'package:putt_putt_pal/util/ExceptionHandler.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/scoring/ScoringPageView.dart';
import 'package:logger/logger.dart';

final socketServiceProvider = ChangeNotifierProvider((ref) => SocketService());

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
  (ref) => GameStateNotifier(
    roomController: RoomController(),
    playerController: PlayerController(),
    holeController: HoleController(),
    playerColorController: PlayerColorController(),
    socketService: ref.read(socketServiceProvider),
  ),
);

class GameStateNotifier extends StateNotifier<GameState> {
  final RoomController roomController;
  final PlayerController playerController;
  final HoleController holeController;
  final PlayerColorController playerColorController;
  final SocketService socketService;
  final Logger logger = Logger();

  GameStateNotifier({
    required this.roomController,
    required this.playerController,
    required this.holeController,
    required this.playerColorController,
    required this.socketService,
  }) : super(const GameState()) {
    _initSocketListeners();
  }

  void _initSocketListeners() {
    socketService.on('roomUpdated', (data) {
      try {
        Room updatedRoom = Room.fromJson(data);
        state = state.copyWith(room: updatedRoom);
      } catch (error) {
        logger.e("Room Updated Error - ${error.toString()}");
      }
    });

    socketService.on('playerListUpdated', (data) {
      try {
        final Map<String, dynamic> castedData = Map<String, dynamic>.from(data);
        Map<String, Player> updatedPlayers = castedData
            .map((key, value) => MapEntry(key, Player.fromJson(value)));
        Room updatedRoom = state.room.copyWith(players: updatedPlayers);
        state = state.copyWith(
            room: updatedRoom,
            currentColor: const PlayerColor(),
            colorPickerMode: false,
            editPlayer: null);
      } catch (error) {
        logger.e("Player List Updated Error - ${error.toString()}");
      }
    });

    socketService.on('holeUpdated', (data) {
      try {
        Hole updatedHole = Hole.fromJson(data);
        Map<String, Hole> updatedHoles = Map.from(state.room.holes);
        updatedHoles[updatedHole.id] = updatedHole;
        Room updatedRoom = state.room.copyWith(holes: updatedHoles);
        state = state.copyWith(room: updatedRoom);
      } catch (error) {
        logger.e("Room Updated Error - ${error.toString()}");
      }
    });

    socketService.on('startGame', (data) {
      try {
        RouterHelper.handleRouteChange(const ScoringPageView());
      } catch (error) {
        logger.e("Start Game Error - ${error.toString()}");
      }
    });

    socketService.on('endGame', (data) {
      try {
        RouterHelper.handleRouteChangeWithBack(const FinalScorePage());
      } catch (error) {
        logger.e("End Game Error - ${error.toString()}");
      }
    });
  }

  Future<void> createRoom() async {
    try {
      Room newRoom = await roomController.createRoom();
      Player tempHost = const Player(isHost: true);
      state = state.copyWith(room: newRoom, currentUser: tempHost);
      socketService.joinRoom(state.room.id);
    } catch (error) {
      logger.e("End Game Error - ${error.toString()}");
      ErrorHandler.handleCreateRoomError();
    }
  }

  Future<void> startGame(int numberOfHoles) async {
    try {
      toggleEditPlayer(null);
      Room startDetails = state.room.copyWith(numberOfHoles: numberOfHoles);
      await roomController.startGame(state.room.id, startDetails);
    } catch (error) {
      logger.e("Start Game Error - ${error.toString()}");
      ErrorHandler.handleStartGameError();
    }
  }

  Future<void> endGame() async {
    try {
      socketService.emit('callEndGame', {
        'roomId': state.room.id,
      });
      RouterHelper.handleRouteChangeWithBack(const FinalScorePage());
    } catch (error) {
      logger.e("End Game Error - ${error.toString()}");
      ErrorHandler.handleEndGameError();
    }
  }

  Future<void> resetState() async {
    try {
      await roomController.updateRoom(state.room.id, const Room());
    } catch (error) {
      logger.e("Reset State Error - ${error.toString()}");
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> resetGameSamePlayers() async {
    try {
      Room updatedRoom = state.room.copyWith(holes: {}, numberOfHoles: 1, allPlayersJoined: true);
      await roomController.updateRoom(state.room.id, updatedRoom);
    } catch (error) {
      logger.e("Reset Game Error - ${error.toString()}");
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> setAllPlayersJoined(bool joined) async {
    try {
      toggleEditPlayer(null);
      Room roomDetails = state.room.copyWith(allPlayersJoined: joined);
      await roomController.updateRoom(state.room.id, roomDetails);
    } catch (error) {
      logger.e("Set AllPlayersJoined error - ${error.toString()}");
      ErrorHandler.handleUpdateError('room');
    }
  }

  Future<void> setNumberOfHoles(int holes) async {
    try {
      Room roomDetails = state.room.copyWith(numberOfHoles: holes);
      await roomController.updateRoom(state.room.id, roomDetails);
    } catch (error) {
      logger.e("Set NumberOfHoles error - ${error.toString()}");
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
            return playerScore.copyWith(score: newScore);
          }
          return playerScore;
        }).toList();

        Hole updatedHole = holeToUpdate.copyWith(playerScores: updatedPlayerScores);
        await holeController.updateHole(state.room.id, updatedHole);
      }
    } catch (error) {
      logger.e("Update PlayerScore error - ${error.toString()}");
      ErrorHandler.handleUpdatePlayerScoreError();
    }
  }

  Future<void> joinRoom(String roomCode, String playerName) async {
    try {
      Room updatedRoom = await roomController.joinRoom(
          roomCode, playerName, false, state.currentColor);
      Player currentUser = updatedRoom.players.values
          .firstWhere((player) => player.name == playerName);
      state = state.copyWith(room: updatedRoom, currentUser: currentUser);
      socketService.joinRoom(updatedRoom.id);
      RouterHelper.handleRouteChange(const WaitingRoom());
    } on RoomNotFoundError catch (error) {
      logger.e(error.toString());
      ExceptionHandler.handleInvalidRoomCode();
    } catch (error) {
      logger.e("Join Room error - ${error.toString()}");
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
      Player addedPlayer =
          await playerController.addPlayer(state.room.id, newPlayer);
      if (addedPlayer.isHost) {
        state = state.copyWith(currentUser: addedPlayer);
      }
    } catch (error) {
      logger.e("Add Player error - ${error.toString()}");
      ErrorHandler.handleAddPlayerError();
    }
  }

  Future<void> removePlayerFromRoom(Player player) async {
    try {
      if (state.room.players.length > 1) {
        await playerController.removePlayer(state.room.id, player);
        toggleEditPlayer(null);
      } else {
        ExceptionHandler.handleDeleteLastPlayerException();
      }
    } catch (error) {
      logger.e("Remove Player error - ${error.toString()}");
      ErrorHandler.handleRemovePlayerError();
    }
  }

  void toggleEditPlayer(Player? player) {
    try {
      state = state.copyWith(editPlayer: player);
      setColorMode(false);
    } catch (error) {
      logger.e("Toggle Edit Player error - ${error.toString()}");
      ErrorHandler.handleUpdatePlayerError();
    }
  }

  Future<void> editPlayer(Player player) async {
    try {
      await playerController.updatePlayer(state.room.id, player);
      toggleEditPlayer(null);
    } catch (error) {
      logger.e("Edit Player error - ${error.toString()}");
      ErrorHandler.handleUpdatePlayerError();
    }
  }

  void toggleColorMode() {
    try {
      state = state.copyWith(colorPickerMode: !state.colorPickerMode);
    } catch (error) {
      logger.e("Toggle ColorMode error - ${error.toString()}");
      ErrorHandler.handleToggleColorModeError();
    }
  }

  void setColorMode(bool updatedColorMode) {
    try {
      state = state.copyWith(colorPickerMode: updatedColorMode);
    } catch (error) {
      logger.e("Set ColorMode error - ${error.toString()}");
      ErrorHandler.handleToggleColorModeError();
    }
  }

  void setPlayerColor(PlayerColor color) {
    try {
      if (state.editPlayer != null) {
        Player updatedEditPlayer = state.editPlayer!.copyWith(color: color);
        state =
            state.copyWith(editPlayer: updatedEditPlayer, currentColor: color);
      } else {
        state = state.copyWith(currentColor: color);
      }
    } catch (error) {
      logger.e("Set PlayerColor error - ${error.toString()}");
      ErrorHandler.handleUpdatePlayerError();
    }
  }

  Future<void> getPlayerColors() async {
    try {
      List<PlayerColor> playerColors =
          await playerColorController.getPlayerColors();
      state = state.copyWith(playerColors: playerColors);
    } catch (error) {
      logger.e("Get PlayerColors error - ${error.toString()}");
      ErrorHandler.handleCreateRoomError();
    }
  }

}
