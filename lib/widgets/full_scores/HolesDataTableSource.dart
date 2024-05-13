import 'package:flutter/material.dart';
import 'package:putt_putt_pal/models/GameState.dart';
import 'package:putt_putt_pal/models/Hole.dart';

class HolesDataTableSource extends DataTableSource {
  final Map<String, Hole> holes;

  HolesDataTableSource(this.holes);

  @override
  DataRow? getRow(int index) {
    final holeNumber = index + 1;
    Hole? hole = holes.values.firstWhere((value) => value.holeNumber == holeNumber);
    
    List<DataCell> cells = [
      DataCell(
        Text(
          hole.holeNumber.toString(),
        ),
      ),
    ];

    cells.addAll(hole.playerScores.map((playerScore) {
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
