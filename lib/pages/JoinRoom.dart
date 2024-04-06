import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/join_room/JoinRoomSettings.dart';

class JoinRoom extends StatelessWidget {
  const JoinRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExpandedCard(
        content: JoinRoomSettings(),
        backgroundColor: Colors.black,
      ),
    );
  }
}
