import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/pages/JoinRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/arc/CircleArc.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCardLink.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import '../styles/colors.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void createRoom() {
      ref.read(gameStateProvider.notifier).createRoom();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WaitingRoom(isHost: true)),
      );
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              ExpandedCardLink(
                  text: 'Create Room',
                  textColor: Colors.black,
                  backgroundColor: CustomColors.offWhite,
                  onPressed: createRoom),
              const ExpandedCardLink(
                text: 'Join Room',
                textColor: CustomColors.offWhite,
                backgroundColor: Colors.black,
                toPage: JoinRoom(),
              ),
            ],
          ),
          const CircleArc(radius: 200, startAngle: 0.25),
        ],
      ),
    );
  }
}
