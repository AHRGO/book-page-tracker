import 'package:flutter/material.dart';

import '../presentation/bloc/progress_tracker_bloc.dart';

class DeleteTrackersButton extends StatelessWidget {
  final ProgressTrackerBloc bloc;

  const DeleteTrackersButton({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        bloc.add(DeleteAllTrackers());
      },
      label: const Text('Delete all trackers'),
      icon: Icon(Icons.delete),
      iconAlignment: IconAlignment.end,
      style: FilledButton.styleFrom(backgroundColor: Colors.red),
    );
  }
}
