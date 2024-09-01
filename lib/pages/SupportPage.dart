import 'package:flutter/material.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PuttPuttPal Support',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: CustomColors.offWhite),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to the PuttPuttPal support page. Here you can find information about our app and how to get help.',
                  style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
                ),
                const SizedBox(height: 24),
                const Text(
                  'App Version:',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: CustomColors.offWhite),
                ),
                const SizedBox(height: 8),
                const Text(
                  '1.0.2',
                  style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Contact Support:',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: CustomColors.offWhite),
                ),
                const SizedBox(height: 8),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'puttputtpal@gmail.com',
                        queryParameters: {'subject': 'Support Request'},
                      );
                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      } else {
                        throw 'Could not launch $emailUri';
                      }
                    },
                    child: const Text(
                      'Email: puttputtpal@gmail.com',
                      style: TextStyle(
                        color: CustomColors.offWhite,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'FAQ:',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: CustomColors.offWhite),
                ),
                const SizedBox(height: 8),
                const Text(
                  '1. How do I use the app?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.offWhite),
                ),
                const SizedBox(height: 8),
                const Text(
                  'From the landing page players can click on Create Room to host their own game or click on Join Room to join an existing room.\nA randomized four letter code will be generated for each room. Other players can enter this code on the Join Room page to join that room.\nOnce all players have joined, the host player can click on the All Players Joined toggle and enter the number of holes to start the game.\nFrom here players will be sent to the scoring pages where they can enter scores for each hole.\nOnce all scores are in, the host player can navigate to the last screen and click on End Game.\nThe scores will be tallied and the winner will be displayed.\nFull scores are available by click the Full Scores button on the end page.',
                  style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
                ),
                const SizedBox(height: 16),
                const Text(
                  '2. How can I change my player color?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.offWhite),
                ),
                const SizedBox(height: 8),
                const Text(
                  'A player joining a room can choose their player color in the bottom grid before clicking the Join Room button.\nThe host player can click on the color palette button next to the add player button and a color wheel will appear.\nA color can be chosen from the wheel and the next player added by the host will have that color\nThe host can also edit a current player\'s color by clicking on their player circle and then going to the color pallete and selecting a new color.\nColors are unique among players.',
                  style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
