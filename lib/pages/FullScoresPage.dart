import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/widgets/full_scores/HolesDataTableSource.dart';

class FullScoresPage extends ConsumerWidget {
  const FullScoresPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes = ref.watch(gameStateProvider.select((state) => state.holes));

    List<DataColumn> createColumns() {
      List<DataColumn> columns = [];
      
      columns.add(const DataColumn(label: Text('Hole')));
      
      Hole tempHole = holes.values.first;

      columns.addAll(tempHole.playerScores.values.map((playerScore) {
        return DataColumn(label: Text(playerScore.player.name));
      }).toList());

      return columns;

    }

    return Scaffold(
      body: PaginatedDataTable(
        columns: createColumns(),
        source: HolesDataTableSource(holes),
        rowsPerPage: 6,
      ),
    );
  }
}
