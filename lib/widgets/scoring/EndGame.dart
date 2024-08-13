import 'package:flutter/material.dart';
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

    void endGame() {
      ref.read(gameStateProvider.notifier).endGame();
    }

    return Scaffold(
      backgroundColor: CustomColors.offWhite,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ExpandedCard(
                        backgroundColor: CustomColors.offWhite,
                        content: BasicButton(
                          color: Colors.black,
                          textColor: CustomColors.offWhite,
                          text: "End Game",
                          onPressed: () {
                            endGame();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
