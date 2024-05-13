import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithButton.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithDoubleButton.dart';
import 'package:putt_putt_pal/widgets/scoring/ScoringPageView.dart';

enum HostInputType { StartGame, AddPlayer, EditPlayer }

class HostSettingsInput extends ConsumerStatefulWidget {
  const HostSettingsInput({super.key});

  @override
  _HostSettingsInputState createState() => _HostSettingsInputState();
}

class _HostSettingsInputState extends ConsumerState<HostSettingsInput> {
  late bool firstJoin;
  late FocusNode _focusNode;
  final TextEditingController _nameController = TextEditingController();
  final HostInputType _hostInputType = HostInputType.AddPlayer;

  void addPlayer(String playerName, bool isHost, PlayerColor color) async {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    final Room room = ref.read(gameStateProvider).room;
    await gameStateNotifier.addPlayerToRoom(ref, room, playerName, isHost, color);
    firstJoin = false;
    setColorMode(false);
    clearTextField();
  }

  void updatePlayer(String playerName) async {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    final Room room = ref.read(gameStateProvider).room;
    final Player? editPlayer = ref.read(gameStateProvider).editPlayer;
    Player updatePlayer = Player(
        id: editPlayer!.id,
        name: playerName,
        playerNumber: editPlayer.playerNumber,
        isHost: editPlayer.isHost,
        color: editPlayer.color);
    await gameStateNotifier.editPlayer(ref, room, updatePlayer);
    gameStateNotifier.toggleEditPlayer(ref, null);
    gameStateNotifier.setPlayerColor(ref, PlayerColor());
    setColorMode(false);
    clearTextField();
  }

  void everyoneIn(bool allPlayersJoined) async {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    final Room updatedRoom = ref.read(gameStateProvider).room;
    gameStateNotifier.toggleEditPlayer(ref, null);
    await gameStateNotifier.setAllPlayersJoined(
        ref, updatedRoom, allPlayersJoined);
    setColorMode(false);
  }

  void toggleColorMode() {
      final gameStateNotifier = ref.read(gameStateProvider.notifier);
      gameStateNotifier.toggleColorMode(ref);
  }

  void setColorMode(bool updatedColorMode) {
      final gameStateNotifier = ref.read(gameStateProvider.notifier);
      gameStateNotifier.setColorMode(ref, updatedColorMode);
  }

  void clearTextField() {
    _nameController.clear();
  }

  void startGame(int numHoles) async {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    final Room room = ref.read(gameStateProvider).room;
    gameStateNotifier.toggleEditPlayer(ref, null);
    await gameStateNotifier.startGame(ref, room, numHoles);
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ScoringPageView()),
      (Route<dynamic> route) => false,
    );
  }

  Color getPlayerColor(Player? editPlayer) {
    return editPlayer != null ? editPlayer.getPlayerBackgroundColor() : Colors.black;
  }

  Color getCurrentColor(PlayerColor currentColor) {
    return Color(int.parse(currentColor.color));
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    firstJoin = true;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _nameController.dispose(); 
    super.dispose();
  }

  Widget _buildInputWidget(HostInputType inputType) {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    final Player? editPlayer = ref.read(gameStateProvider).editPlayer;
    final PlayerColor playerColor = ref.read(gameStateProvider).currentColor;
    switch (inputType) {
      case HostInputType.StartGame:
        return TextInputWithButton(
          buttonText: 'Start Game',
          buttonColor: Colors.black,
          buttonTextColor: CustomColors.offWhite,
          textFieldHintText: 'Number of Holes',
          textFieldTextColor: Colors.black,
          textFieldBackgroundColor: CustomColors.offWhite,
          textFieldBorderColor: Colors.black,
          isNumberInput: true,
          textFieldMaxLength: 2,
          focusNode: _focusNode,
          controller: TextEditingController(),
          onButtonPressed: (numHoles) {
            startGame(int.parse(numHoles));
          },
        );
      case HostInputType.AddPlayer:
        return TextInputWithDoubleButton(
          buttonOneText: firstJoin ? 'Add Host' : 'Add Other Player',
          buttonOneColor: getCurrentColor(playerColor),
          buttonOneTextColor: CustomColors.offWhite,
          buttonTwoIcon: Icons.color_lens_outlined,
          buttonTwoColor: CustomColors.offWhite,
          buttonTwoIconColor: getCurrentColor(playerColor),
          textFieldHintText: 'Enter Name',
          textFieldTextColor: Colors.black,
          textFieldBackgroundColor: CustomColors.offWhite,
          textFieldBorderColor: getCurrentColor(playerColor),
          isNumberInput: false,
          textFieldMaxLength: 20,
          focusNode: _focusNode,
          controller: _nameController,
          onButtonOnePressed: (name) {
            addPlayer(name, firstJoin, playerColor);
          },
          onButtonTwoPressed: () {
            toggleColorMode();
          },
        );
      case HostInputType.EditPlayer:
        return TextInputWithDoubleButton(
          buttonOneText: 'Edit Player',
          buttonOneColor: getPlayerColor(editPlayer),
          buttonOneTextColor: editPlayer != null ? editPlayer!.getPlayerTextColor() : CustomColors.offWhite,
          buttonTwoIcon: Icons.color_lens_outlined,
          buttonTwoColor: CustomColors.offWhite,
          buttonTwoIconColor: getPlayerColor(editPlayer),
          textFieldHintText: 'Enter Name',
          textFieldTextColor: Colors.black,
          textFieldBackgroundColor: CustomColors.offWhite,
          textFieldBorderColor: getPlayerColor(editPlayer),
          isNumberInput: false,
          textFieldMaxLength: 20,
          focusNode: _focusNode,
          controller: TextEditingController(text: editPlayer!.name),
          onButtonOnePressed: (name) {
            updatePlayer(name);
          },
          onButtonTwoPressed: () {
            toggleColorMode();
          },
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);

    ref.listen<bool>(
      gameStateProvider.select((state) => state.room.allPlayersJoined),
      (_, allPlayersJoined) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusNode.requestFocus();
        });
      },
    );

    final inputWidget = _buildInputWidget(
      gameState.room.allPlayersJoined
          ? HostInputType.StartGame
          : gameState.editPlayer == null
              ? HostInputType.AddPlayer
              : HostInputType.EditPlayer,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'All Players Joined: ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Switch(
              value: gameState.room.allPlayersJoined,
              onChanged: (value) => everyoneIn(value),
              activeColor: Colors.black,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: CustomColors.offWhite.withOpacity(0.5),
            ),
          ],
        ),
        inputWidget,
      ],
    );
  }
}
