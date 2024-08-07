import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';

class CustomAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showPauseButton;
  final Color backgroundColor;

  const CustomAppBar(
      {Key? key,
        required this.title,
        this.showBackButton = false,
        this.showPauseButton = false,
        required this.backgroundColor}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {

  void togglePaused() {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    gameStateNotifier.toggleCirclePaused();
  }

  List<Widget> buildActions() {
    final bool isPaused = ref.watch(gameStateProvider).circlePaused;
    List<Widget> actions = [];
    if (widget.showPauseButton) {
      actions.add(IconButton(
        icon: !isPaused ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        onPressed: () {
          togglePaused();
        },
      ));
    }
    return actions;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(widget.title),
        backgroundColor: widget.backgroundColor,
        leading: widget.showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  context.pop();
                },
              )
            : null,
        actions: buildActions());
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
