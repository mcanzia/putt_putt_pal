import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/ColorOrb.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/orbit/ColorCirclePainter.dart';
import 'package:touchable/touchable.dart';

class ColorCircle extends ConsumerStatefulWidget {
  const ColorCircle({Key? key}) : super(key: key);

  @override
  _ColorCircleState createState() => _ColorCircleState();
}

class _ColorCircleState extends ConsumerState<ColorCircle>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  List<ColorOrb> colors = [];

  @override
  void initState() {
    super.initState();
    ref.read(gameStateProvider.notifier).getPlayerColors();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

  }

  void updateColorList(List<PlayerColor> playerColors) {
    setState(() {
      colors = [];
      for (int i = 0; i < playerColors.length; i++) {
        double orbAngle = 2 * pi + (i * pi / 6);
        ColorOrb colorOrb = ColorOrb(
          angle: orbAngle,
          color: playerColors[i],
          isTaken: ref.read(gameStateProvider.notifier).isColorTaken(playerColors[i])
        );
        colors.add(colorOrb);
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _handleTap(PlayerColor playerColor) {
    ref.read(gameStateProvider.notifier).setPlayerColor(playerColor);
  }

  void _handleClear() {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    gameStateNotifier.setPlayerColor(PlayerColor());
  }

  @override
  Widget build(BuildContext context) {

    // Initialize color list
    final playerColors =
        ref.watch(gameStateProvider.select((gsp) => gsp.playerColors));
    updateColorList(playerColors);

    ref.listen<Map<String,Player>>(gameStateProvider.select((gsp) => gsp.room.players), (previous, next) {
      updateColorList(playerColors);
    });

    final selectedColor =
        ref.watch(gameStateProvider.select((gsp) => gsp.currentColor));

    final editPlayer = ref.watch(gameStateProvider.select((gsp) => gsp.editPlayer));

    // Get Room Code
    final roomCode =
        ref.watch(gameStateProvider.select((gsp) => gsp.room.roomCode));

    final isPaused = ref.watch(gameStateProvider.select((gsp) => gsp.circlePaused));

    return Center(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onTapDown],
        builder: (context) => CustomPaint(
          size: const Size(275, 275),
          painter: ColorCirclePainter(
            context: context,
            animation: _controller,
            colors: colors,
            roomCode: roomCode,
            onTap: (index) => _handleTap(playerColors[index]),
            onClear: _handleClear,
            selectedColor: selectedColor,
            editPlayer: editPlayer,
            isPaused: isPaused
          ),
        ),
      ),
    );
  }
}
