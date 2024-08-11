import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/util/RouterHelper.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? backButtonCallback;
  final bool showHomeButton;
  final bool showPauseButton;
  final Color backgroundColor;
  final Color textColor;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.backButtonCallback,
      this.showHomeButton = false,
      this.showPauseButton = false,
      required this.backgroundColor,
      this.textColor = Colors.black})
      : super(key: key);

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

  void goHome() {
    final gameStateNotifier = ref.read(gameStateProvider.notifier);
    gameStateNotifier.resetFullState();
    RouterHelper.handleRouteChange('/');
  }

  List<Widget> buildActions() {
    final bool isPaused = ref.watch(gameStateProvider).circlePaused;
    List<Widget> actions = [];
    if (widget.showPauseButton) {
      actions.add(IconButton(
        color: widget.textColor,
        icon: !isPaused ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        onPressed: () {
          togglePaused();
        },
      ));
    }
    if (widget.showHomeButton) {
      actions.add(
        IconButton(
          color: widget.textColor,
          icon: Icon(Icons.home),
          onPressed: () {
            goHome();
          },
        ),
      );
    }
    return actions;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: widget.title != null ? Text(widget.title!, style: TextStyle(color: widget.textColor)) : null,
        backgroundColor: widget.backgroundColor,
        leading: widget.backButtonCallback != null
            ? IconButton(
                color: widget.textColor,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  widget.backButtonCallback!();
                },
              )
            : null,
        actions: buildActions());
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
