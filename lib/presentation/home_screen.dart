import 'package:book_page_tracker/mock/page_tracker_mocked_list.dart';
import 'package:book_page_tracker/widgets/no_progress_tracker_widget.dart';
import 'package:book_page_tracker/widgets/progress_tracker_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NoProgressTrackerWidget(),
        ...PageTrackerMockedList.list.map((e) => ProgressTrackerWidget(progressTracker: e)),
      ],
    );
  }
}
