import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/scoring/ScoreSlider.dart';

class PersonalScore extends StatelessWidget {
  const PersonalScore(
      {super.key, required this.player, required this.currentUser, required this.onScoreChanged, required this.currentScore});

  final Player player;
  final Player currentUser;
  final int currentScore;
  final Function(Player player, int score) onScoreChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            player.name,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 30,
              color: player.getPlayerTextColor(),
            ),
          ),
          Center(
            child: ScoreSlider(
              key: ValueKey('slider_$key'),
              currentScore: currentScore,
              currentUser: currentUser,
              player: player,
              onScoreChanged: onScoreChanged,
            ),
          ),
        ],
      ),
    );
  }
}
