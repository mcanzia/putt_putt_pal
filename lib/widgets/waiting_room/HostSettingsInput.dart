import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/util/ExceptionHandler.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithButton.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithDoubleButton.dart';

enum HostInputType { StartGame, AddPlayer, EditPlayer }

class HostSettingsInput extends ConsumerStatefulWidget {
  const HostSettingsInput({super.key});

  @override
  _HostSettingsInputState createState() => _HostSettingsInputState();
}

class _HostSettingsInputState extends ConsumerState<HostSettingsInput> {
  late FocusNode _focusNode;
  final TextEditingController _nameController = TextEditingController();
  final HostInputType _hostInputType = HostInputType.AddPlayer;

  void addPlayer(String playerName, bool isHost, PlayerColor color) async {
    if (checkDuplicateName(playerName)) {
        return;
    }
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    await gameStateNotifier.addPlayerToRoom(playerName, isHost, color);
    clearTextField();
  }

  void updatePlayer(String playerName) async {

    if (checkDuplicateName(playerName)) {
        return;
    }
    
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    final Player? editPlayer = ref.read(gameStateProvider).editPlayer;
    Player updatePlayer = Player(
        id: editPlayer!.id,
        name: playerName,
        isHost: editPlayer.isHost,
        color: editPlayer.color);
    await gameStateNotifier.editPlayer(updatePlayer);
    clearTextField();
  }

  bool checkDuplicateName(String playerName) {
    final bool duplicateName = ref.read(gameStateProvider.select((gsp) => gsp.room.duplicateName(playerName)));
    if (duplicateName) {
      ExceptionHandler.handleDuplicateNameException();
      return true;
    }
    return false;
  } 

  void everyoneIn(bool allPlayersJoined) async {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    await gameStateNotifier.setAllPlayersJoined(allPlayersJoined);
  }

  void toggleColorMode() {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    gameStateNotifier.toggleColorMode();
  }

  void clearTextField() {
    _nameController.clear();
  }

  void startGame(int numHoles) async {
    final hostPlayerJoined = ref.read(gameStateProvider.select((gsp) => gsp.room.hostPresent()));
    if (!hostPlayerJoined) {
      ExceptionHandler.handleHostPlayerMustBePresentException();
      return;
    }
    if (numHoles <= 0) {
      ExceptionHandler.handleNumHolesMustBeGreaterThanZeroException();
      return;
    }
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    await gameStateNotifier.startGame(numHoles);
  }

  Color getPlayerColor(Player? editPlayer) {
    return editPlayer != null
        ? editPlayer.getPlayerBackgroundColor()
        : Colors.black;
  }

  Color getCurrentColor(PlayerColor currentColor) {
    return Color(int.parse(currentColor.color));
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget _buildInputWidget(HostInputType inputType) {
    final bool hostPresent = ref.read(gameStateProvider).room.hostPresent();
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
          buttonOneText: !hostPresent ? 'Add Host' : 'Add Other Player',
          buttonOneTextIcon: !hostPresent ? Icons.stars_rounded : null,
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
            addPlayer(name, !hostPresent, playerColor);
          },
          onButtonTwoPressed: () {
            toggleColorMode();
          },
        );
      case HostInputType.EditPlayer:
        return TextInputWithDoubleButton(
          buttonOneText: editPlayer!.isHost ? 'Edit Host' : 'Edit Player',
          buttonOneColor: getPlayerColor(editPlayer),
          buttonOneTextIcon: editPlayer!.isHost ? Icons.stars_rounded : null,
          buttonOneTextColor: editPlayer != null
              ? editPlayer!.getPlayerTextColor()
              : CustomColors.offWhite,
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
