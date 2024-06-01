import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/full_scores/HolesDataTableSource.dart';

class FullScoresPage extends ConsumerWidget {
  const FullScoresPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes =
        ref.watch(gameStateProvider.select((state) => state.room.holes));
    final players = ref.watch(gameStateProvider.select((state) => state.room.players));

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
                players[playerScore.playerId]!.name,
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

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.offWhite,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: CustomColors.offWhite,
      systemNavigationBarIconBrightness: Brightness.light
    ));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: CustomColors.offWhite,
      ),
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
      bottomNavigationBar: const BottomAppBar(
        color: CustomColors.offWhite
      ),
    );
  }
}
