import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/common/CustomAppBar.dart';
import 'package:putt_putt_pal/widgets/full_scores/HoleScoreListItem.dart';

class FullScoresPagePaginated extends ConsumerWidget {
  const FullScoresPagePaginated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes =
        ref.watch(gameStateProvider.select((state) => state.room.holes));
    final players =
        ref.watch(gameStateProvider.select((state) => state.room.players));
    final rankings =
        ref.watch(gameStateProvider.select((state) => state.getRankings()));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: CustomColors.offWhite,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: CustomColors.offWhite,
        systemNavigationBarIconBrightness: Brightness.dark));

    void goBackToFinalScorePage() {
      RouterHelper.handleRouteChange('/final-scores');
    }

    return Scaffold(
      appBar: CustomAppBar(
        backButtonCallback: goBackToFinalScorePage,
        backgroundColor: CustomColors.offWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HoleScoreListItem(
              players: players,
              chipColor: Colors.white,
              backgroundColor: Colors.black,
              rankings: rankings,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: holes.length,
              itemBuilder: (context, index) {
                final hole = holes.values.elementAt(index);
                return HoleScoreListItem(
                  hole: hole,
                  players: players,
                  chipColor: Colors.black,
                  backgroundColor: CustomColors.offWhite,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
