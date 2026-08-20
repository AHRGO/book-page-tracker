import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_screen.dart';
import 'bloc/progress_tracker_bloc.dart';
import 'screens/empty_progress_screen.dart';
import 'screens/progress_trackers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: BlocConsumer<ProgressTrackerBloc, ProgressTrackerState>(
        listener: (context, state) {
          if (state is DeletedAllProgressTrackersState) {
            context.read<ProgressTrackerBloc>().add(LoadProgressTrackerList());
          }
        },
        builder: (context, state) {
          if (state is LoadingProgressTrackerState) {
            return const CircularProgressIndicator();
          }

          if (state is LoadedProgressTrackersListState) {
            final progressTrackerList = state.progressTrackerList.toList();
            return progressTrackerList.isEmpty
                ? const EmptyProgressScreen()
                : ProgressTrackersScreen(progressTrackerList: progressTrackerList);
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
