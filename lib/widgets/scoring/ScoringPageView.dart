import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/scoring/EndGame.dart';

class ScoringPageView extends ConsumerWidget {
  const ScoringPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(gameStateProvider.select((state) => state.room));
    List<Hole> sortedHoles = room.holes.values.toList()
      ..sort((a, b) => a.holeNumber.compareTo(b.holeNumber));

    final PageController _controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: room.numberOfHoles + 1,
        itemBuilder: (context, index) {
          return index == room.numberOfHoles
              ? EndGame(
                  pageController: _controller,
                )
              : ScoringPage(
                  hole: sortedHoles[index],
                  pageController: _controller,
                );
        },
      ),
    );
  }
}
