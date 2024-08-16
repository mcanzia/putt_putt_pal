import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Player.dart';
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
    Player? currentUser = ref.watch(gameStateProvider.select((gsp) => gsp.currentUser));
    void playAgain() async {
      await ref.read(gameStateProvider.notifier).resetGameSamePlayers();
    }

    return Container(
      color: Colors.black,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BasicButton(
            text: 'See Full Scores',
            color: CustomColors.offWhite,
            textColor: Colors.black,
            onPressed: () => {
              RouterHelper.handleRouteChangeWithBack('/full-scores')
            },
          ),
          const SizedBox(height: 16),
          if (currentUser?.isHost ?? false)
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
