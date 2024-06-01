import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/cards/TitleCard.dart';
import 'package:putt_putt_pal/widgets/final_score/FinalScoreButtons.dart';
import 'package:putt_putt_pal/widgets/final_score/FinalScoreRankings.dart';
import '../styles/colors.dart';

class FinalScorePage extends ConsumerWidget {
  const FinalScorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankings = ref.watch(gameStateProvider.select((state) => state.getRankings()));
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.offWhite,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.offWhite,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              ExpandedCard(
                content: TitleCard(
                  backgroundColor: CustomColors.offWhite,
                  textColor: Colors.black,
                  text: "The winner is...\n${rankings.isNotEmpty ? rankings[0].player.name : '' }",
                ),
                backgroundColor: CustomColors.offWhite,
              ),
              const ExpandedCard(
                content: FinalScoreRankings(),
                backgroundColor: Colors.black,
              ),
              const ExpandedCard(
                content: FinalScoreButtons(),
                backgroundColor: Colors.black,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black
      ),
    );
  }
}
