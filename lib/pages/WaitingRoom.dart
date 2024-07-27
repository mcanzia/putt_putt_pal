import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/orbit/ColorCircle.dart';
import 'package:putt_putt_pal/widgets/orbit/GuestCircle.dart';
import 'package:putt_putt_pal/widgets/waiting_room/GuestSettings.dart';
import 'package:putt_putt_pal/widgets/waiting_room/HostSettings.dart';
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
      appBar: AppBar(
        backgroundColor: CustomColors.offWhite,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: <Widget>[
                ExpandedCard(
                  content: isColorPickerMode
                      ? const ColorCircle()
                      : const GuestCircle(),
                  backgroundColor: CustomColors.offWhite,
                ),
                ExpandedCard(
                  content: (currentUser != null && currentUser.isHost)
                      ? const HostSettings()
                      : const GuestSettings(),
                  backgroundColor: CustomColors.offWhite,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(color: CustomColors.offWhite),
    );
  }
}
