import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.offWhite,
      statusBarIconBrightness:
          Brightness.dark,
      systemNavigationBarColor:
          CustomColors.offWhite,
      systemNavigationBarIconBrightness:
          Brightness.dark,
    ));
    final isColorPickerMode =
        ref.watch(gameStateProvider.select((state) => state.colorPickerMode));
    final currentUser =
        ref.watch(gameStateProvider.select((state) => state.currentUser));

    void goBackToLandingPage() async {
      if (currentUser != null && !currentUser.isHost) {
        await ref.read(gameStateProvider.notifier).removePlayerFromRoom(currentUser);
      }
      ref.read(gameStateProvider.notifier).resetFullState();
      RouterHelper.handleRouteChange('/');
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.offWhite,
      appBar: CustomAppBar(
        backButtonCallback: goBackToLandingPage,
        backgroundColor: CustomColors.offWhite,
        showPauseButton: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              (currentUser != null && currentUser.isHost)
                    ? const HostSettings()
                    : const GuestSettings(),
              SizedBox(height: 35),
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
