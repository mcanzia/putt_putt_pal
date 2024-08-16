import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/styles/colors.dart';

class HoleScoreListItem extends StatelessWidget {
  final Hole hole;
  final Map<String, Player> players;

  HoleScoreListItem({required this.hole, required this.players});

  @override
  Widget build(BuildContext context) {
    final sortedScores = hole.playerScores.toList()
      ..sort((a, b) => a.score.compareTo(b.score));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: CustomColors.offWhite,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hole ${hole.holeNumber}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: sortedScores.map((playerScore) {
                final playerName = players[playerScore.playerId]!.name.toUpperCase();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        backgroundColor: Colors.black,
                        label: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            playerName,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      ),
                      const SizedBox(width: 8.0),
                      Chip(
                        backgroundColor: CustomColors.offWhite,
                        side: const BorderSide(color: Colors.transparent),
                        label: Text(
                          playerScore.score.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
