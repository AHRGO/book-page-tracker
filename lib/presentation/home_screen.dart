import 'package:book_page_tracker/presentation/empty_progress_screen.dart';
import 'package:book_page_tracker/presentation/progress_trackers_screen.dart';
import 'package:flutter/material.dart';

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
          child: hasProgressTrackers
              ? ProgressTrackersScreen()
              : EmptyProgressScreen(),
        ),
      ),
    );
  }
}
