import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/pages/JoinRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/arc/CircleArc.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCardLink.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import '../styles/colors.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  void createRoom() async {
    await ref.read(gameStateProvider.notifier).createRoom();
    RouterHelper.handleRouteChange(const WaitingRoom());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.offWhite,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark
    ));
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
