import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/progress_tracker_model.dart';
import '../../widgets/app_screen.dart';
import '../../widgets/progress_tracker_widget.dart';
import '../bloc/progress_tracker_bloc.dart';
import 'create_tracker/create_tracker_screen.dart';

class ProgressTrackersScreen extends StatelessWidget {
  final List<ProgressTrackerModel> progressTrackerList;

  const ProgressTrackersScreen({super.key, required this.progressTrackerList});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16.0,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateTrackerScreen()));
                  },
                  label: const Text('Create a new tracker'),
                  icon: Icon(Icons.add),
                  iconAlignment: IconAlignment.end,
                ),
                FilledButton.icon(
                  onPressed: () => context.read<ProgressTrackerBloc>().add(DeleteAllTrackers()),
                  label: const Text('Delete trackers'),
                  icon: Icon(Icons.delete),
                  iconAlignment: IconAlignment.end,
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
            ...progressTrackerList.map((e) => ProgressTrackerWidget(progressTracker: e)),
          ],
        ),
      ),
    );
  }
}
