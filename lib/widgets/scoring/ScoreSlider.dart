import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:putt_putt_pal/models/Player.dart';

class ScoreSlider extends StatefulWidget {
  const ScoreSlider({
    super.key,
    required this.player,
    required this.currentUser,
    required this.onScoreChanged,
    required this.currentScore,
  });

  final Player player;
  final Player currentUser;
  final int currentScore;
  final Function(Player player, int score) onScoreChanged;

  @override
  State<ScoreSlider> createState() => _ScoreSliderState();
}

class _ScoreSliderState extends State<ScoreSlider> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentScore;
  }

  @override
  void didUpdateWidget(covariant ScoreSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentScore != widget.currentScore) {
      setState(() {
        _currentValue = widget.currentScore;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled =
        widget.currentUser.isHost || widget.currentUser.id == widget.player.id;

    return AbsorbPointer(
      absorbing: !isEnabled,
      child: NumberPicker(
        value: _currentValue,
        minValue: 0,
        maxValue: 20,
        haptics: true,
        axis: Axis.horizontal,
        step: 1,
        onChanged: (value) {
          if (isEnabled) {
            setState(() {
              _currentValue = value;
              HapticFeedback.selectionClick();
            });
            widget.onScoreChanged(widget.player, value);
          }
        },
        selectedTextStyle: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 30,
          color: widget.player.getPlayerTextColor(),
        ),
        textStyle: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 20,
          color: widget.player.getPlayerTextColor().withOpacity(0.5),
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: widget.player.getPlayerTextColor(),
              width: 2.0,
            ),
            bottom: BorderSide(
              color: widget.player.getPlayerTextColor(),
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
