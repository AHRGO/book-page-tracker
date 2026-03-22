import 'package:book_page_tracker/mock/page_tracker_mocked_list.dart';
import 'package:book_page_tracker/widgets/progress_tracker_widget.dart';
import 'package:flutter/material.dart';

class ProgressTrackersScreen extends StatelessWidget {
  const ProgressTrackersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16.0,
          children: PageTrackerMockedList.list
              .map(
                (e) => ProgressTrackerWidget(progressTracker: e),
              )
              .toList(),
        ),
      ),
    );
  }
}
