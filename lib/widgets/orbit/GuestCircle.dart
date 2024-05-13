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

  void updateGuestsList(List<Player> players) {
    setState(() {
      guests = [];
      for (int i = 0; i < players.length; i++) {
        double orbAngle = 2 * pi + (i * pi / 6);
        GuestOrb guestOrb = GuestOrb(
          angle: orbAngle,
          occupied: i == players.length ? false : true,
          name: i == players.length ? null : players[i].getFirstInitial(),
          isHost: players[i].isHost,
          color: players[i].getPlayerBackgroundColor(),
          textColor: players[i].getPlayerTextColor()
        );
        if (!(i == players.length && players.length == 12)) {
          guests.add(guestOrb);
        }
      }

    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _handleTap(Player player) {
      final room = ref.watch(gameStateProvider.select((gsp) => gsp.room));
      ref.read(gameStateProvider.notifier).toggleEditPlayer(ref, player);
  }

  @override
  Widget build(BuildContext context) {

    // listen for updates
    ref.listen<List<Player>>(gameStateProvider.select((gsp) => gsp.room.players), (previous, next) {
      updateGuestsList(next);
    });

    // Initialize guest list
    final players = ref.watch(gameStateProvider.select((gsp) => gsp.room.players));
    updateGuestsList(players);

    // Get Room Code
    final roomCode = ref.watch(gameStateProvider.select((gsp) => gsp.room.roomCode));

    return Center(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onTapDown],
        builder: (context) => CustomPaint(
          size: const Size(225, 225),
          painter: GuestCirclePainter(
            context: context,
            animation: _controller,
            guests: guests,
            roomCode: roomCode,
            onTap: (index) => _handleTap(players[index])),
          ),
        ),
    );
      
  }
}
