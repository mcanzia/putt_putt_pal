import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';
import 'package:putt_putt_pal/widgets/common/ConfirmationDialog.dart';

class EndGame extends ConsumerWidget {
  const EndGame({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;

    void triggerEndGame() {
      ref.read(gameStateProvider.notifier).endGame();
      Navigator.of(context).pop();
    }

    void cancelEndGame() {
      Navigator.of(context).pop();
    }

    void confirmEndGame() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialog(
              "Have all scores been entered?", triggerEndGame, cancelEndGame);
        },
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.offWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => pageController.previousPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
        backgroundColor: CustomColors.offWhite,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: CustomColors.offWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExpandedCard(
                        backgroundColor: CustomColors.offWhite,
                        content: BasicButton(
                          color: Colors.black,
                          textColor: CustomColors.offWhite,
                          text: "End Game",
                          onPressed: () {
                            confirmEndGame();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
