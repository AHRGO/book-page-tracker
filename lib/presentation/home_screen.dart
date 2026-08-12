import 'package:flutter/material.dart';

import 'screens/empty_progress_screen.dart';
import 'screens/progress_trackers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final hasProgressTrackers = PageTrackerMockedList.list.isNotEmpty;
    final hasProgressTrackers = true;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: hasProgressTrackers ? ProgressTrackersScreen() : EmptyProgressScreen(),
        ),
      ),
    );
  }
}
