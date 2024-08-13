import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/models/Player.dart';
import 'package:putt_putt_pal/models/PlayerScore.dart';

class HolesDataTableSource extends DataTableSource {
  final Map<String, Hole> holes;
  final Map<String, Player> players;

  HolesDataTableSource(this.holes, this.players);

  @override
  DataRow? getRow(int index) {
    final playerId = players.keys.elementAt(index);
    final player = players[playerId];
    
    List<DataCell> cells = [
      DataCell(
        Text(
          player!.name,
        ),
      ),
    ];

    cells.addAll(holes.values.map((hole) {
      final playerScore = hole.playerScores.firstWhere(
        (score) => score.playerId == player.id,
        orElse: () => PlayerScore(id: '0', playerId: player.id, score: 0),
      );
      return DataCell(
        Text(
          playerScore.score.toString(),
        ),
      );
    }).toList());

    return DataRow(cells: cells);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => holes.length;

  @override
  int get selectedRowCount => 0;
}
