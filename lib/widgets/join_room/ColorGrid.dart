import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/join_room/ColorGridPainter.dart';
import 'package:touchable/touchable.dart';

class ColorGrid extends ConsumerStatefulWidget {
  const ColorGrid({super.key});

  @override
  _ColorGridState createState() => _ColorGridState();
}

class _ColorGridState extends ConsumerState<ColorGrid>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ref.read(gameStateProvider.notifier).getPlayerColors();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleTap(PlayerColor playerColor) {
    ref.read(gameStateProvider.notifier).setPlayerColor(playerColor);
  }

  void _handleClear() {
    ref.read(gameStateProvider.notifier).setPlayerColor(PlayerColor());
  }

  @override
  Widget build(BuildContext context) {
    // Initialize color list
    final playerColors =
        ref.watch(gameStateProvider.select((gsp) => gsp.playerColors));

    final selectedColor =
        ref.watch(gameStateProvider.select((gsp) => gsp.currentColor));

    return Center(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onTapDown],
        builder: (context) => CustomPaint(
          size: const Size(350, 350),
          painter: ColorGridPainter(
            context: context,
            colors: playerColors,
            selectedColor: selectedColor,
            onTap: (index) => _handleTap(
              playerColors[index],
            ),
            onClear: _handleClear,
          ),
        ),
      ),
    );
  }
}
