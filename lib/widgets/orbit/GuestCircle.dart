import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/GuestOrb.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/Room.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/orbit/GuestCirclePainter.dart';
import 'package:touchable/touchable.dart';

class GuestCircle extends ConsumerStatefulWidget {
  const GuestCircle({Key? key}) : super(key: key);

  @override
  _GuestCircleState createState() => _GuestCircleState();
}

class _GuestCircleState extends ConsumerState<GuestCircle>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  List<GuestOrb> guests = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  void updateGuestsList(Map<String, Player> players) {
    setState(() {
      guests = [];
      int i = 0;
      players.entries.forEach((entry) {
        double orbAngle = 2 * pi + (i * pi / 6);
        GuestOrb guestOrb =
            GuestOrb(angle: orbAngle, occupied: true, player: entry.value);
        guests.add(guestOrb);
        i++;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _handleTap(Player player) async {
    final editPlayer =
        ref.read(gameStateProvider.select((gsp) => gsp.editPlayer));
    if (editPlayer != null && editPlayer.id == player.id) {
      await ref.read(gameStateProvider.notifier).removePlayerFromRoom(player);
      return;
    }
    ref.read(gameStateProvider.notifier).toggleEditPlayer(player);
  }

  @override
  Widget build(BuildContext context) {
    // listen for updates
    ref.listen<Map<String, Player>>(
        gameStateProvider.select((gsp) => gsp.room.players), (previous, next) {
      updateGuestsList(next);
    });

    // Initialize guest list
    final players =
        ref.watch(gameStateProvider.select((gsp) => gsp.room.players));
    updateGuestsList(players);

    // Get Room Code
    final roomCode =
        ref.watch(gameStateProvider.select((gsp) => gsp.room.roomCode));
    final editPlayer =
        ref.watch(gameStateProvider.select((gsp) => gsp.editPlayer));
    final currentUser =
        ref.watch(gameStateProvider.select((gsp) => gsp.currentUser));
    final isPaused =
        ref.watch(gameStateProvider.select((gsp) => gsp.circlePaused));

    return Center(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onTapDown],
        builder: (context) => CustomPaint(
          size: const Size(275, 275),
          painter: GuestCirclePainter(
              context: context,
              animation: _controller,
              guests: guests,
              roomCode: roomCode,
              editPlayer: editPlayer,
              currentUser: currentUser,
              onTap: (player) => _handleTap(player),
              isPaused: isPaused),
        ),
      ),
    );
  }
}
