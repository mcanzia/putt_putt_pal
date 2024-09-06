import 'package:flutter/material.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text(
                    "PuttPuttPal Support",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontFamily: 'Lobster'),
                  ),
                  background: Container(
                    color: Colors.black,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome to the PuttPuttPal support page. Here you can find information about our app and how to get help.',
                        style: TextStyle(
                            fontSize: 16, color: CustomColors.offWhite),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'App Version:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.offWhite),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '1.0.3',
                        style: TextStyle(
                            fontSize: 16, color: CustomColors.offWhite),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Contact Support:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.offWhite),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
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
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
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
                        'Donate:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.offWhite),
                      ),
                      const SizedBox(height: 8),
                      BuyMeACoffeeButton(buyMeACoffeeName: "canospaghetti"),
                      const SizedBox(height: 24),
                      const Text(
                        'How To Use The App:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.offWhite),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: CustomColors.offWhite,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: CustomColors.offWhite,
                    tabs: [
                      Tab(text: 'HOST'),
                      Tab(text: 'GUEST'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              HostContent(),
              GuestContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class HostContent extends StatelessWidget {
  const HostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'To host a room, click on the Create Room panel on the top of the landing page.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/createRoom.png', width: 300, height: 300),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'On the waiting room page a four letter code will be generated. This can be given to other players so they can join your room.\nStart by entering your name as the host in the text box and clicking the Add Host button.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/waiting-add-host.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Player color can be changed by click on the color palette button and then selecting a color from the wheel.\nColors are unique to each player and unavailable colors will be grayed out.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Image.asset('assets/images/waiting-color-change.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Other players can be added by the host by entering their name in the same box and clicking Add Other Player.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Image.asset('assets/images/waiting-add-other.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'The host player can edit players by clicking on their player icon in the guest circle.\nIn edit mode, a player\'s name and color can be changed and they can be removed by clicking again on their player icon.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0, 
            alignment: WrapAlignment.center,
            children: [
              Image.asset('assets/images/waiting-edit-player.png',
                  width: 300, height: 500),
              Image.asset('assets/images/delete-player.png',
                  width: 300, height: 500),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'The spinning animation of the circle can be paused by clicking the pause button on the top right corner.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Image.asset('assets/images/waiting-pause.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'If the host player chooses to leave the room, they will have to confirm their decision since this will delete the room for all players.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Image.asset('assets/images/waiting-host-leave.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Once all players have joined, the host player may click on the All Players Joined toggle.\nThe number of holes for the game can then be entered into the text box.\nOnce Start Game is pressed, the game will begin for all players.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Image.asset('assets/images/waiting-all-joined.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'On the scoring pages, a list of all players will appear with score sliders.\nThe host player can update the scores for any player including their own.\nPressing the arrows on the top of the page will let players navigate between holes.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Image.asset('assets/images/scoring.png', width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'On the last scoring page, an End Game button will appear.\nThe host player can confirm all scores are entered and the game will end.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0, 
            alignment: WrapAlignment.center,
            children: [
              Image.asset('assets/images/end-game.png',
                  width: 300, height: 500),
              Image.asset('assets/images/confirm-end-game.png',
                  width: 300, height: 500),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'The final page will display the winner of the game at the top and the top three players just below it.\nPressing on See Full Scores will show a list of all player scores broken down by holes.\nClicking Play Again will send all players back to the waiting room to start another game.\nPlayers can quit the current room by pressing the home icon on the top right corner.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0, 
            alignment: WrapAlignment.center,
            children: [
              Image.asset('assets/images/final-page.png',
                  width: 300, height: 500),
              Image.asset('assets/images/full-scores.png',
                  width: 300, height: 500),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class GuestContent extends StatelessWidget {
  const GuestContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'To join a room, click on the Join Room panel on the bottom of the landing page.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/joinRoom.png', width: 300, height: 300),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ask the host player for the four letter code to enter the correct room.\nEnter your player name and optionally choose a color from the grid.\nIf another player in that room has already claimed that color, an error will appear when joining the room.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/guest-join-room.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'In the waiting room, your player icon will appear in the guest circle.\nWait here until the host starts the game.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/guest-waiting-room.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'On the scoring page, as a guest player, you will only be able to update your own scores for each hole.\nThe host player will end the game when all scores are in.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/guest-scoring.png',
              width: 300, height: 500),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Final scores will be shown once the game has ended.\nYou can click the Full Scores page see scores for all player scores for each hole.',
              style: TextStyle(fontSize: 16, color: CustomColors.offWhite),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/guest-final-page.png',
              width: 300, height: 500),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
