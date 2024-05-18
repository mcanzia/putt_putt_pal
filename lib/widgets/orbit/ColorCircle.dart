import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/ColorOrb.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/GuestOrb.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerColor.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/orbit/ColorCirclePainter.dart';
import 'package:putt_putt_pal/widgets/orbit/GuestCirclePainter.dart';
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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  void updateColorList(List<PlayerColor> playerColors) {
    List<PlayerColor> takenColors = ref.read(gameStateProvider.select((gsp) => gsp.getTakenColors()));
    setState(() {
      colors = [];
      for (int i = 0; i < playerColors.length; i++) {
        double orbAngle = 2 * pi + (i * pi / 6);
        ColorOrb colorOrb = ColorOrb(
          angle: orbAngle,
          color: Color(int.parse(playerColors[i].color)),
          isTaken: takenColors.contains(playerColors[i])
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

  void _handleTap(PlayerColor playerColor, bool isTaken) {
      Player? editPlayer = ref.read(gameStateProvider.select((gsp) => gsp.editPlayer));
      PlayerColor? currentColor = ref.read(gameStateProvider.select((gsp) => gsp.currentColor));
      if (!isTaken || playerColor == editPlayer!.color) {
        ref.read(gameStateProvider.notifier).setPlayerColor(playerColor);
      }
  }

  @override
  Widget build(BuildContext context) {

    // listen for updates
    ref.listen<List<PlayerColor>>(gameStateProvider.select((gsp) => gsp.room.playerColors), (previous, next) {
      updateColorList(next);
    });

    // Initialize color list
    final playerColors = ref.watch(gameStateProvider.select((gsp) => gsp.room.playerColors));
    updateColorList(playerColors);

    // Get Room Code
    final roomCode = ref.watch(gameStateProvider.select((gsp) => gsp.room.roomCode));

    return Center(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onTapDown],
        builder: (context) => CustomPaint(
          size: const Size(225, 225),
          painter: ColorCirclePainter(
            context: context,
            animation: _controller,
            colors: colors,
            roomCode: roomCode,
            onTap: (index, isTaken) => _handleTap(playerColors[index], isTaken)),
          ),
        ),
    );
      
  }
}
