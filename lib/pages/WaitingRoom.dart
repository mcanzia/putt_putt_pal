import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/orbit/ColorCircle.dart';
import 'package:putt_putt_pal/widgets/orbit/GuestCircle.dart';
import 'package:putt_putt_pal/widgets/waiting_room/GuestSettings.dart';
import 'package:putt_putt_pal/widgets/waiting_room/HostSettings.dart';
import '../styles/colors.dart';

class WaitingRoom extends ConsumerWidget {
  final bool isHost;

  const WaitingRoom({super.key, required this.isHost});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isColorPickerMode = ref.watch(gameStateProvider.select((state) => state.colorPickerMode));

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              ExpandedCard(
                content: isColorPickerMode ? ColorCircle() : GuestCircle(),
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
