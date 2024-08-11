import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/scoring/EndGame.dart';
import 'package:go_router/go_router.dart';

class ScoringPageView extends ConsumerStatefulWidget {
  final int pageIndex;

  const ScoringPageView({super.key, required this.pageIndex});

  @override
  _ScoringPageViewState createState() => _ScoringPageViewState();
}

class _ScoringPageViewState extends ConsumerState<ScoringPageView> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.pageIndex);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final room = ref.watch(gameStateProvider.select((gsp) => gsp.room));
    final currentUser = ref.watch(gameStateProvider.select((gsp) => gsp.currentUser));
    List<Hole> sortedHoles = room.holes.values.toList()
      ..sort((a, b) => a.holeNumber.compareTo(b.holeNumber));

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currentUser!.isHost ? room.numberOfHoles + 1 : room.numberOfHoles,
        onPageChanged: (index) {
          RouterHelper.handleScorePageChange(index);
        },
        itemBuilder: (context, index) {
          return index == room.numberOfHoles
              ? EndGame(
                  pageController: _controller!,
                )
              : ScoringPage(
                  hole: sortedHoles[index],
                  pageController: _controller!,
                );
        },
      ),
    );
  }
}
