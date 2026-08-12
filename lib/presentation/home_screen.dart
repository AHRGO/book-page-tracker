import 'package:flutter/material.dart';
import 'package:progress_tracker/widgets/app_screen.dart';

import 'screens/empty_progress_screen.dart';
import 'screens/progress_trackers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final hasProgressTrackers = PageTrackerMockedList.list.isNotEmpty;

    // final hasProgressTrackers = true;
    final hasProgressTrackers = false;

    return AppScreen(
      child: hasProgressTrackers
          ? ProgressTrackersScreen()
          : EmptyProgressScreen(),
    );
  }
}
