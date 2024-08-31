import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerRanking.dart';
import 'package:putt_putt_pal/styles/colors.dart';

class HoleScoreListItem extends StatelessWidget {
  final Hole? hole;
  final Map<String, Player> players;
  final List<PlayerRanking>? rankings;
  final Color chipColor;
  final Color backgroundColor;

  HoleScoreListItem(
      {this.hole,
      required this.players,
      this.rankings,
      required this.chipColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    List sortedScores = [];
    if (rankings == null && hole != null) {
      sortedScores = hole!.playerScores.toList()
        ..sort((a, b) => a.score.compareTo(b.score));
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: chipColor,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rankings != null ? 'Final Score' : 'Hole ${hole!.holeNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: chipColor),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8.0),
            rankings != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: rankings!.map((playerScore) {
                      final playerName = playerScore.player.name.toUpperCase();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Chip(
                              backgroundColor: chipColor,
                              label: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  playerName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: backgroundColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                            ),
                            const SizedBox(width: 8.0),
                            Chip(
                              backgroundColor: backgroundColor,
                              side: BorderSide(color: backgroundColor),
                              label: Text(
                                playerScore.score.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: chipColor
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: sortedScores.map((playerScore) {
                      final playerName =
                          players[playerScore.playerId]!.name.toUpperCase();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Chip(
                              backgroundColor: chipColor,
                              label: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  playerName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: backgroundColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                            ),
                            const SizedBox(width: 8.0),
                            Chip(
                              backgroundColor: backgroundColor,
                              side: const BorderSide(color: Colors.transparent),
                              label: Text(
                                playerScore.score.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
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
