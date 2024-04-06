import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';

class FinalScoreRankings extends ConsumerWidget {
  const FinalScoreRankings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankings = ref.watch(gameStateProvider.select((state) => state.getRankings()));

    int displayCount = rankings.length >= 3 ? 3 : rankings.length;
    
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < displayCount; i++) 
            _buildPlayerScore(rankings[i], i == 0 ? 40.0 : 30.0),
        ],
      ),
    );
  }
  Widget _buildPlayerScore(PlayerScore playerScore, double fontSize) {
    return Text(
      '${playerScore.player.name}: ${playerScore.score}',
      style: TextStyle(
        fontFamily: 'Lobster',
        fontSize: fontSize,
        color: CustomColors.offWhite,
      ),
    );
  }
}
