import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';
import 'package:putt_putt_pal/widgets/common/BasicTextInput.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithButton.dart';

class JoinRoomSettings extends ConsumerStatefulWidget {
  const JoinRoomSettings({super.key});

  @override
  _JoinRoomSettingsState createState() => _JoinRoomSettingsState();
}

class _JoinRoomSettingsState extends ConsumerState<JoinRoomSettings> {
  late TextEditingController nameController;
  late TextEditingController roomCodeController;
  late FocusNode _focusNode;

  void joinRoom(String roomCode, String playerName) async {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    await gameStateNotifier.joinRoom(ref, roomCode, playerName);
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const WaitingRoom(isHost: false),
      ),
      (Route<dynamic> route) => false,
    );
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
    double buttonWidth = screenWidth * 0.4;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
            child: BasicTextInput(
              hintText: 'Enter Name',
              textColor: CustomColors.offWhite,
              backgroundColor: Colors.black,
              borderColor: Colors.black,
              maxLength: 20,
              controller: nameController,
            ),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
            child: TextInputWithButton(
              buttonText: 'Join Room',
              buttonColor: CustomColors.offWhite,
              buttonTextColor: Colors.black,
              textFieldHintText: 'Enter Room Code',
              textFieldTextColor: CustomColors.offWhite,
              textFieldBackgroundColor: Colors.black,
              textFieldBorderColor: Colors.black,
              textFieldMaxLength: 4,
              textFieldBasic: false,
              controller: roomCodeController,
              onButtonPressed: (value) {
                joinRoom(value, nameController.text);
              },
            ),
          ),
          const Text(
            'or',
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 40,
              color: CustomColors.offWhite,
            ),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
            child: BasicButton(
              text: 'Scan QR Code',
              color: CustomColors.offWhite,
              textColor: Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
