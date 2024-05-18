import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/full_scores/HolesDataTableSource.dart';

class FullScoresPagePaginated extends ConsumerWidget {
  const FullScoresPagePaginated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes =
        ref.watch(gameStateProvider.select((state) => state.room.holes));
    final players = ref.watch(gameStateProvider.select((state) => state.room.players));


    List<DataColumn> createColumns() {
      List<DataColumn> columns = [];

      columns.add(const DataColumn(label: Text('Hole')));

      Hole? tempHole = holes.values.first;

      columns.addAll(tempHole!.playerScores.map((playerScore) {
        return DataColumn(label: Text(players[playerScore.playerId]!.name));
      }).toList());

      return columns;
    }

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: SingleChildScrollView(
            child: PaginatedDataTable(
              columns: createColumns(),
              source: HolesDataTableSource(holes),
              rowsPerPage: 6,
              header: Text('Full Scores'),
            ),
          ),
        ),
      ),
    );
  }
}
