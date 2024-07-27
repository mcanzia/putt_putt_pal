import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:putt_putt_pal/pages/FinalScorePage.dart';
import 'package:putt_putt_pal/pages/FullScoresPage.dart';
import 'package:putt_putt_pal/pages/JoinRoom.dart';
import 'package:putt_putt_pal/pages/LandingPage.dart';
import 'package:putt_putt_pal/pages/ScoringPage.dart';
import 'package:putt_putt_pal/pages/WaitingRoom.dart';
import 'package:putt_putt_pal/widgets/scoring/ScoringPageView.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
    ),
    GoRoute(
      path: '/join-room',
      builder: (context, state) => JoinRoom(),
    ),
    GoRoute(
      path: '/waiting-room',
      builder: (context, state) => WaitingRoom(),
    ),
    GoRoute(
      path: '/scoring',
      builder: (context, state) => ScoringPageView(),
    ),
    GoRoute(
      path: '/final-scores',
      builder: (context, state) => FinalScorePage(),
    ),
    GoRoute(
      path: '/full-scores',
      builder: (context, state) => FullScoresPage(),
    ),
  ],
);
