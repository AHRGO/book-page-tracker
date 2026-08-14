import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_screen.dart';
import 'bloc/hive_box_bloc.dart';
import 'screens/empty_progress_screen.dart';
import 'screens/progress_trackers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: BlocProvider(
        create: (context) => HiveBoxBloc()..add(LoadProgressTrackerBox()),
        child: BlocBuilder<HiveBoxBloc, HiveBoxState>(
          builder: (context, state) {
            if (state is HiveBoxLoadingState) {
              return const CircularProgressIndicator();
            }

            if (state is HiveBoxLoadedProgressTrackerBoxState) {
              final progressTrackerList = state.progressTrackerBox.values
                  .toList();
              return progressTrackerList.isEmpty
                  ? const EmptyProgressScreen()
                  : ProgressTrackersScreen(
                      progressTrackerList: progressTrackerList,
                    );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
