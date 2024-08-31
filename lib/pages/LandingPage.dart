import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/pages/JoinRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/util/LoggerUtil.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/arc/CircleArc.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCardLink.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/widgets/common/ConfirmationDialog.dart';
import '../styles/colors.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {

  void confirmCreateRoom() async {
    promptRejoinGame(true, startNewRoom);
  }

  void confirmJoinRoom() {
    promptRejoinGame(false, goToJoinRoom);
  }

  void promptRejoinGame(bool isCreateRoom, VoidCallback onCancelCallback) async {
    await ref.read(gameStateProvider.notifier).checkSocketConnectionStatus();
    Room room = ref.read(gameStateProvider.select((gsp) => gsp.room));
    if (room.roomCode.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialog(
              "It looks like you already have a game in progress. Would you like to continue it?", continueOldRoom, onCancelCallback);
        },
      );
    } else {
      onCancelCallback();
    }
  }

  void continueOldRoom() async {
    Room room = ref.read(gameStateProvider.select((gsp) => gsp.room));
    ref.read(gameStateProvider.notifier).rejoinRoomSocket();
    if (room.isFinished) {
      RouterHelper.handleRouteChange('/final-scores');
      return;
    }
    if (room.holes.isNotEmpty) {
      RouterHelper.handleRouteChange('/scoring/0');
      return;
    }
    RouterHelper.handleRouteChange('/waiting-room');
  }

  void startNewRoom() async {
    await ref.read(gameStateProvider.notifier).createRoom();
    RouterHelper.handleRouteChange('/waiting-room');
  }

  void goToJoinRoom() {
    RouterHelper.handleRouteChange('/join-room');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.offWhite, // Sets the color of the status bar
      statusBarIconBrightness:
          Brightness.dark, // Sets the color of the status bar icons
      systemNavigationBarColor:
          CustomColors.offWhite, // Sets the color of the system navigation bar
      systemNavigationBarIconBrightness:
          Brightness.dark, // Sets the color of the navigation bar icons
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              ExpandedCardLink(
                  text: 'Create Room',
                  textColor: Colors.black,
                  backgroundColor: CustomColors.offWhite,
                  onPressed: confirmCreateRoom),
              ExpandedCardLink(
                text: 'Join Room',
                textColor: CustomColors.offWhite,
                backgroundColor: Colors.black,
                onPressed: confirmJoinRoom,
              ),
            ],
          ),
          const CircleArc(radius: 200, startAngle: 0.25),
        ],
      ),
    );
  }
}
