import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';

class EndGame extends ConsumerWidget {
  const EndGame({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;

    void confirmEndGame() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              "Have all scores been entered?",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(gameStateProvider.notifier).endGame();
                  Navigator.of(context).pop();
                },
                child: const Text("Yes"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
            ],
          );
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
