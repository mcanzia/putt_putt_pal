import 'package:flutter/material.dart';
import 'package:putt_putt_pal/pages/FinalScorePage.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/common/BasicButton.dart';

class EndGame extends StatelessWidget {
  const EndGame({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.offWhite,
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
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                      ),
                      ExpandedCard(
                        backgroundColor: CustomColors.offWhite,
                        content: BasicButton(
                          color: Colors.black,
                          textColor: CustomColors.offWhite,
                          text: "End Game",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FinalScorePage()),
                            );
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
