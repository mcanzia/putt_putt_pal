import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/pages/FullScoresPage.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';

class FinalScoreButtons extends ConsumerWidget {
  const FinalScoreButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void playAgain() async {
      await ref.read(gameStateProvider.notifier).resetGameSamePlayers();
      RouterHelper.handleRouteChange(const WaitingRoom());
    }

    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BasicButton(
            text: 'See Full Scores',
            color: CustomColors.offWhite,
            textColor: Colors.black,
            onPressed: () => {
              RouterHelper.handleRouteChangeWithBack(const FullScoresPage())
            },
          ),
          BasicButton(
            text: 'Play Again?',
            color: CustomColors.offWhite,
            textColor: Colors.black,
            onPressed: () => {
              playAgain(),
            },
          )
        ],
      ),
    );
  }
}
