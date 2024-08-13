import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/models/Hole.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';
import 'package:putt_putt_pal/widgets/common/CustomAppBar.dart';
import 'package:putt_putt_pal/widgets/full_scores/HolesDataTableSource.dart';
import 'package:putt_putt_pal/widgets/full_scores/HoleScoreListItem.dart';

class FullScoresPagePaginated extends ConsumerWidget {
  const FullScoresPagePaginated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes =
        ref.watch(gameStateProvider.select((state) => state.room.holes));
    final players =
        ref.watch(gameStateProvider.select((state) => state.room.players));

    List<DataColumn> createColumns() {
      List<DataColumn> columns = [];

      columns.add(const DataColumn(label: Text('Player')));

      columns.addAll(holes.values.map((hole) {
        return DataColumn(label: Text('Hole ${hole.holeNumber}'));
      }).toList());

      return columns;
    }

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: CustomColors.offWhite,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: CustomColors.offWhite,
        systemNavigationBarIconBrightness: Brightness.dark));

    void goBackToFinalScorePage() {
      RouterHelper.handleRouteChange('/final-scores');
    }

    return Scaffold(
      appBar: CustomAppBar(
        backButtonCallback: goBackToFinalScorePage,
        backgroundColor: CustomColors.offWhite,
      ),
      body: ListView.builder(
        itemCount: holes.length,
        itemBuilder: (context, index) {
          final hole = holes.values.elementAt(index);
          return HoleScoreListItem(hole: hole, players: players);
        },
      ),
    );

    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: CustomAppBar(
    //     backButtonCallback: goBackToFinalScorePage,
    //     backgroundColor: CustomColors.offWhite,
    //   ),
    //   body: Center(
    //     child: ConstrainedBox(
    //       constraints:
    //           BoxConstraints(minWidth: MediaQuery.of(context).size.width),
    //       child: SingleChildScrollView(
    //         child: PaginatedDataTable(
    //           columns: createColumns(),
    //           headingRowColor: const WSCOffWhite(),
    //           arrowHeadColor: Colors.black,
    //           source: HolesDataTableSource(holes, players),
    //           rowsPerPage: 6,
    //           header: const Text('Full Scores',
    //               style: TextStyle(decorationThickness: 10)),
    //           showEmptyRows: false,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
