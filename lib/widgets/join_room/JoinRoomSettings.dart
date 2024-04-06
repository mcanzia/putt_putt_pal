import 'package:flutter/material.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';
import 'package:putt_putt_pal/widgets/common/BasicTextInput.dart';
import 'package:putt_putt_pal/widgets/common/TextInputWithButton.dart';

class JoinRoomSettings extends StatelessWidget {
  const JoinRoomSettings({super.key});

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
              child: const BasicTextInput(
                hintText: 'Enter Name',
                textColor: CustomColors.offWhite,
                backgroundColor: Colors.black,
                maxLength: 20,
              )),
          ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
              child: const TextInputWithButton(
                buttonText: 'Join Room',
                buttonColor: CustomColors.offWhite,
                buttonTextColor: Colors.black,
                textFieldHintText: 'Enter Room Code',
                textFieldTextColor: CustomColors.offWhite,
                textFieldBackgroundColor: Colors.black,
                textFieldMaxLength: 4,
                textFieldBasic: false,
                toPage: WaitingRoom(isHost: false),
              )),
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
