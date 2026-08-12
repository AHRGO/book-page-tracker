import 'package:flutter/material.dart';

import '../../mock/page_tracker_mocked_list.dart';
import '../../widgets/app_screen.dart';
import '../../widgets/progress_tracker_widget.dart';

class ProgressTrackersScreen extends StatelessWidget {
  const ProgressTrackersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16.0,
          children: PageTrackerMockedList.list
              .map(
                (e) =>
                    ProgressTrackerWidget(progressTracker: e),
              )
              .toList(),
        ),
      ),
    );
  }
}
