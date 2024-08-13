import 'package:flutter/material.dart';

class CustomColors {
  static const MaterialColor offWhite = MaterialColor(
      0xFFF7F2FB,
      <int, Color>{
        50: Color(0xFFF7F2FB),
        100: Color(0xFFF7F2FB),
        200: Color(0xFFF7F2FB),
        300: Color(0xFFF7F2FB),
        400: Color(0xFFF7F2FB),
        500: Color(0xFFF7F2FB),
        600: Color(0xFFF7F2FB),
        700: Color(0xFFF7F2FB),
        800: Color(0xFFF7F2FB),
        900: Color(0xFFF7F2FB),
      },
    );

}

class WSCOffWhite extends WidgetStateColor {
  const WSCOffWhite() : super(_defaultColor);

  static const int _defaultColor = 0xFFF7F2FB;
  static const int _pressedColor = 0xFFF7F2FB;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}