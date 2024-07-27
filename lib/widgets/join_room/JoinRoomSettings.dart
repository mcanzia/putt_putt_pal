import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/util/ExceptionHandler.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithButton.dart';
import 'package:putt_putt_pal/widgets/common/UpperCaseTextField.dart';
import 'package:putt_putt_pal/widgets/join_room/ColorGrid.dart';

class JoinRoomSettings extends ConsumerStatefulWidget {
  const JoinRoomSettings({super.key});

  @override
  _JoinRoomSettingsState createState() => _JoinRoomSettingsState();
}

class _JoinRoomSettingsState extends ConsumerState<JoinRoomSettings> {
  late TextEditingController nameController;
  late TextEditingController roomCodeController;
  late FocusNode _focusNode;

  void joinRoom(String playerName, String roomCode) async {
    if (roomCode.isEmpty) {
      ExceptionHandler.handleTextFieldIsEmptyException('Room Code');
      return;
    }
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    await gameStateNotifier.joinRoom(roomCode, playerName);
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    roomCodeController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8;

    final PlayerColor playerColor = ref.watch(gameStateProvider).currentColor;

    Color getFillColor() {
      if (playerColor.id == 0) {
        return CustomColors.offWhite;
      }
      return playerColor.getColorObject();
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
            child: UppercaseTextField(
              hintText: 'Enter Room Code',
              textColor: CustomColors.offWhite,
              backgroundColor: Colors.black,
              borderColor: getFillColor(),
              maxLength: 4,
              controller: roomCodeController,
            ),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
            child: TextInputWithButton(
              buttonText: 'Join Room',
              buttonColor: getFillColor(),
              buttonTextColor: Colors.black,
              textFieldHintText: 'Enter Name',
              textFieldTextColor: CustomColors.offWhite,
              textFieldBackgroundColor: Colors.black,
              textFieldBorderColor: getFillColor(),
              textFieldMaxLength: 20,
              textFieldBasic: true,
              controller: nameController,
              onButtonPressed: (value) {
                joinRoom(value, roomCodeController.text);
              },
            ),
          ),
          const ColorGrid(),
        ],
      ),
    );
  }
}