import 'package:book_page_tracker/mock/page_tracker_mocked_list.dart';
// import 'package:book_page_tracker/widgets/no_progress_tracker_widget.dart';
import 'package:book_page_tracker/widgets/progress_tracker_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128.0),
        child: Center(
          child: SingleChildScrollView(
          
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.0,
              children: [
                // NoProgressTrackerWidget(),
                ...PageTrackerMockedList.list.map(
                  (e) => ProgressTrackerWidget(progressTracker: e),
                ),
              ],
            ),
          ),
        ),
      ),
    );  
    
  }
}
