import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/util/Debouncer.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/cards/TitleCard.dart';
import 'package:putt_putt_pal/widgets/scoring/PersonalScore.dart';

class ScoringPage extends ConsumerWidget {
  ScoringPage({
    super.key,
    required this.hole,
    required this.pageController,
  }) : _debouncer = Debouncer(delay: Duration(milliseconds: 300));

  final Hole hole;
  final PageController pageController;
  final Debouncer _debouncer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PlayerScore> playerScores = hole.playerScores;
    final int totalHoles =
        ref.watch(gameStateProvider.select((gsp) => gsp.room.numberOfHoles));
    final Map<String, Player> players = ref.watch(gameStateProvider.select((gsp) => gsp.room.players));
    Player? currentUser = ref.watch(gameStateProvider.select((gsp) => gsp.currentUser));
    final screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.offWhite,
      systemNavigationBarColor: CustomColors.offWhite,
    ));

    void onScoreChanged(Player player, int newScore) {
      _debouncer.run(() {
        ref.read(gameStateProvider.notifier).updatePlayerScore(
              hole,
              player,
              newScore,
            );
      });
    }

    int getCurrentScore(String playerId) {
      return ref.read(
                            gameStateProvider.select((state) =>
                                state.getPlayerScore(
                                    hole, players[playerId]!)));
    }

    return Scaffold(
      backgroundColor: CustomColors.offWhite,
      appBar: AppBar(
        backgroundColor: CustomColors.offWhite,
      ),
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
                        onPressed: hole.holeNumber > 1
                            ? () => pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                )
                            : null,
                      ),
                      TitleCard(
                        backgroundColor: CustomColors.offWhite,
                        textColor: Colors.black,
                        text: 'Hole ${hole.holeNumber}',
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: hole.holeNumber <= totalHoles
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
                    children: playerScores.map((entry) {
                      final playerScore = entry.score;
                      return ExpandedCard(
                        content: PersonalScore(
                          key: ValueKey(
                              '${entry.playerId}_${hole.id}'),
                          player: players[entry.playerId]!,
                          currentUser: currentUser!,
                          currentScore: getCurrentScore(entry.playerId),
                          onScoreChanged: onScoreChanged,
                        ),
                        backgroundColor:
                            players[entry.playerId]!.getPlayerBackgroundColor(),
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
