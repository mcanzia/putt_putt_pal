import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:putt_putt_pal/styles/colors.dart';

class Player {
  final String name;
  final int playerNumber;

  Player(this.name, this.playerNumber);

  getPlayerTextColor() {
    return playerNumber % 2 != 0 ? CustomColors.offWhite : Colors.black;
  }

  getPlayerBackgroundColor() {
    return playerNumber % 2 == 0 ? CustomColors.offWhite : Colors.black;
  }

  getFirstInitial() {
    return name[0];
  }

}