import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/orbit/GuestCircle.dart';
import 'package:putt_putt_pal/widgets/waiting_room/GuestSettings.dart';
import 'package:putt_putt_pal/widgets/waiting_room/HostSettings.dart';
import '../styles/colors.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({super.key, required this.isHost});

  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              const ExpandedCard(
                content: GuestCircle(),
                backgroundColor: CustomColors.offWhite,
              ),
              ExpandedCard(
                content: isHost ? const HostSettings() : const GuestSettings(),
                backgroundColor: CustomColors.offWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
