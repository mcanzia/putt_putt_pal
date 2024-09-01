import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:putt_putt_pal/pages/FinalScorePage.dart';
import 'package:putt_putt_pal/pages/FullScoresPage.dart';
import 'package:putt_putt_pal/pages/FullScoresPagePaginated.dart';
import 'package:putt_putt_pal/pages/JoinRoom.dart';
import 'package:putt_putt_pal/pages/LandingPage.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/pages/SupportPage.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/providers/GameStateProvider.dart';
import 'package:putt_putt_pal/styles/colors.dart';
import 'package:putt_putt_pal/transitions/CircularRevealPageRoute.dart';
import 'package:putt_putt_pal/widgets/scoring/ScoringPageView.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LandingPage(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CircularRevealTransition(
            animation: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/join-room',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const JoinRoom(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CircularRevealTransition(
            animation: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/waiting-room',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const WaitingRoom(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CircularRevealTransition(
            animation: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/scoring/:pageIndex',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ScoringPageView(
          pageIndex:
              int.tryParse(state.pathParameters['pageIndex'] ?? '0') ?? 0,
        ),
        transitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/final-scores',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: FinalScorePage(),
        transitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/full-scores',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: FullScoresPagePaginated(),
        transitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/support',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SupportPage(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
  ],
);
