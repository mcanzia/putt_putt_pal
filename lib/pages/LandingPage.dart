import 'package:flutter/material.dart';
import 'package:putt_putt_pal/pages/JoinRoom.dart';
import 'package:putt_putt_pal/widgets/arc/CircleArc.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCardLink.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import '../styles/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              ExpandedCardLink(
                text: 'Create Room',
                textColor: Colors.black,
                backgroundColor: CustomColors.offWhite,
                toPage: WaitingRoom(isHost: true),
              ),
              ExpandedCardLink(
                text: 'Join Room',
                textColor: CustomColors.offWhite,
                backgroundColor: Colors.black,
                toPage: JoinRoom(),
              ),
            ],
          ),
          CircleArc(radius: 200, startAngle: 0.25),
        ],
      ),
    );
  }
}
