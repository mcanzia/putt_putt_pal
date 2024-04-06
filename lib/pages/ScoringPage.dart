import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/cards/TitleCard.dart';
import 'package:putt_putt_pal/widgets/scoring/PersonalScore.dart';

class ScoringPage extends ConsumerWidget {
  const ScoringPage({
    super.key,
    required this.holeNumber,
    required this.pageController,
  });

  final int holeNumber;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<int, PlayerScore> playerScores = ref.watch(
      gameStateProvider
          .select((gsp) => gsp.holes[holeNumber]?.playerScores ?? {}),
    );
    final int totalHoles =
        ref.watch(gameStateProvider.select((gsp) => gsp.numberOfHoles));
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.offWhite,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: holeNumber > 1
                            ? () => pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                )
                            : null,
                      ),
                      TitleCard(
                        backgroundColor: CustomColors.offWhite,
                        textColor: Colors.black,
                        text: 'Hole $holeNumber',
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: holeNumber <= totalHoles
                            ? () => pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                )
                            : null,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: playerScores.entries.map((entry) {
                      final playerScore = entry.value;
                      return ExpandedCard(
                        content: PersonalScore(
                          key: ValueKey('${entry.key}_$holeNumber'),
                          player: playerScore.player,
                          currentScore: ref.watch(
                            gameStateProvider.select((state) =>
                                state.getPlayerScore(holeNumber, entry.key)),
                          ),
                          onScoreChanged: (player, newScore) {
                            ref
                                .read(gameStateProvider.notifier)
                                .updatePlayerScore(
                                  holeNumber,
                                  player.playerNumber,
                                  newScore,
                                );
                          },
                        ),
                        backgroundColor:
                            playerScore.player.getPlayerBackgroundColor(),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
