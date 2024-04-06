import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithButton.dart';
import 'package:putt_putt_pal/widgets/scoring/ScoringPageView.dart';

class HostSettingsInput extends ConsumerStatefulWidget {
  const HostSettingsInput({super.key});

  @override
  _HostSettingsInputState createState() => _HostSettingsInputState();
}

class _HostSettingsInputState extends ConsumerState<HostSettingsInput> {
  late FocusNode _focusNode;

  void addPlayer(Player player) {
    ref.read(gameStateProvider.notifier).addPlayer(player);
    ref.read(gameStateProvider.notifier).setAllPlayersJoined(true);
  }

  void startGame(int numHoles) {
    ref.read(gameStateProvider.notifier).startGame(numHoles);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ScoringPageView()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);

    ref.listen<bool>(
      gameStateProvider.select((state) => state.allPlayersJoined),
      (_, allPlayersJoined) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _focusNode.requestFocus();
          });
      },
    );

    return gameState.allPlayersJoined
        ? TextInputWithButton(
            buttonText: 'Start Game',
            buttonColor: Colors.black,
            buttonTextColor: CustomColors.offWhite,
            textFieldHintText: 'Number of Holes',
            textFieldTextColor: Colors.black,
            textFieldBackgroundColor: CustomColors.offWhite,
            isNumberInput: true,
            textFieldMaxLength: 2,
            focusNode: _focusNode,
            onButtonPressed: (numHoles) {
              startGame(int.parse(numHoles));
            })
        : TextInputWithButton(
            buttonText: 'Add Player',
            buttonColor: Colors.black,
            buttonTextColor: CustomColors.offWhite,
            textFieldHintText: 'Enter Name',
            textFieldTextColor: Colors.black,
            textFieldBackgroundColor: CustomColors.offWhite,
            isNumberInput: false,
            textFieldMaxLength: 20,
            focusNode: _focusNode,
            onButtonPressed: (name) {
              addPlayer(Player(name, gameState.players.length + 1));
            });
  }
}
