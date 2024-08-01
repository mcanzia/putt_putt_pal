import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/orbit/ColorCircle.dart';
import 'package:putt_putt_pal/widgets/orbit/GuestCircle.dart';
import 'package:putt_putt_pal/widgets/waiting_room/GuestSettings.dart';
import 'package:putt_putt_pal/widgets/waiting_room/HostSettings.dart';
import 'package:putt_putt_pal/widgets/common/CustomAppBar.dart';
import '../styles/colors.dart';

class WaitingRoom extends ConsumerStatefulWidget {
  const WaitingRoom({super.key});

  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class _WaitingRoomState extends ConsumerState<WaitingRoom> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: CustomColors.offWhite,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: CustomColors.offWhite,
        systemNavigationBarIconBrightness: Brightness.light));
  }

  @override
  Widget build(BuildContext context) {
    final isColorPickerMode =
        ref.watch(gameStateProvider.select((state) => state.colorPickerMode));
    final currentUser =
        ref.watch(gameStateProvider.select((state) => state.currentUser));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.offWhite,
      appBar: CustomAppBar(
        title: 'Room',
        showBackButton: true,
        backgroundColor: CustomColors.offWhite
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              (currentUser != null && currentUser.isHost)
                    ? const HostSettings()
                    : const GuestSettings(),
              isColorPickerMode
                    ? const ColorCircle()
                    : const GuestCircle(),
            ],
          ),
        ],
      ),
    );
  }
}
