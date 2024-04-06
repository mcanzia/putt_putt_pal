import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/scoring/EndGame.dart';

class ScoringPageView extends ConsumerWidget {
  const ScoringPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalHoles =
        ref.watch(gameStateProvider.select((state) => state.numberOfHoles));

    final PageController _controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: totalHoles + 1,
        itemBuilder: (context, index) {
          return index == totalHoles
              ? EndGame(
                  pageController: _controller,
                )
              : ScoringPage(
                  holeNumber: index + 1,
                  pageController: _controller,
                );
        },
      ),
    );
  }
}
