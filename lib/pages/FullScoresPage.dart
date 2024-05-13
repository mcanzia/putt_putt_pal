import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/full_scores/HolesDataTableSource.dart';

class FullScoresPage extends ConsumerWidget {
  const FullScoresPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes =
        ref.watch(gameStateProvider.select((state) => state.room.holes));

    List<DataColumn> createColumns() {
      List<DataColumn> columns = [];

      columns.add(
        const DataColumn(
          label: Expanded(
            child: Center(
              child: Text(
                'Hole',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

      Hole? tempHole = holes.values.first;

      columns.addAll(tempHole!.playerScores.map((playerScore) {
        return DataColumn(
          label: Expanded(
            child: Center(
              child: Text(
                playerScore.player.name,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }).toList());

      return columns;
    }

    List<DataRow> createRows() {
      return holes.values.map((hole) {
        return DataRow(cells: [
          DataCell(
            Center(
              child: Text(
                hole.holeNumber.toString(),
              ),
            ),
          ),
          ...hole.playerScores.map(
            (score) => DataCell(
              Center(
                child: Text(
                  score.score.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ]);
      }).toList();
    }

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: SingleChildScrollView(
            child: DataTable(
              columns: createColumns(),
              rows: createRows(),
              dividerThickness: 2.0,
              headingTextStyle: const TextStyle(
                fontFamily: 'Lobster',
                fontSize: 30,
                color: Colors.black,
              ),
              dataTextStyle: const TextStyle(
                fontFamily: 'Lobster',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
