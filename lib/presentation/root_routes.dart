import 'package:book_page_tracker/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();

// @TypedShellRoute<>

//TODO: TERMINAR SA COISA
class RootRoutes extends ShellRouteData {
  const RootRoutes();

  // static final List<NavigatorObserver>  $observers = <NavigatorObserver>[
  //   GoRouterObserver(),
  // ];

  // static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKey;

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return NoTransitionPage(
      name: '/home',
      child: const HomeScreen(),
    );
  }
}
