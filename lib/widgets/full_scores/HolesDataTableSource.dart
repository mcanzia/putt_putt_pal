import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/Hole.dart';

class HolesDataTableSource extends DataTableSource {
  final Map<int, Hole> holes;

  HolesDataTableSource(this.holes);

  @override
  DataRow? getRow(int index) {
    final holeNumber = index + 1;
    if (!holes.containsKey(holeNumber)) return null;

    Hole hole = holes[holeNumber]!;
    List<DataCell> cells = [
      DataCell(
        Text(
          hole.holeNumber.toString(),
        ),
      ),
    ];

    cells.addAll(hole.playerScores.values.map((playerScore) {
      return DataCell(
        Text(
          playerScore.score.toString(),
        ),
      );
    }).toList());
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => holes.length;

  @override
  int get selectedRowCount => 0;
}
