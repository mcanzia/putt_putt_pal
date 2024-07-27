import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:putt_putt_pal/widgets/cards/ExpandedCard.dart';
import 'package:putt_putt_pal/widgets/join_room/JoinRoomSettings.dart';

class JoinRoom extends StatelessWidget {
  const JoinRoom({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black),
        ),
        child: const Column(
          children: [
            ExpandedCard(
              content: JoinRoomSettings(),
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}