import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../datasources/hive_datasource.dart';
import '../../models/progress_tracker_model.dart';

part 'progress_tracker_state.dart';
part 'progress_tracker_event.dart';

class ProgressTrackerBloc extends Bloc<ProgressTrackerEvent, ProgressTrackerState> {
  ProgressTrackerBloc() : super(InitialProgressTrackerState()) {
    on<LoadProgressTrackerList>((event, emit) async {
      emit(LoadingProgressTrackerState());

      final box = await hive.getProgressTrackerBox();
      final trackersList = box.values.toList();

      emit(LoadedProgressTrackersListState(progressTrackerList: trackersList));
    });

    on<AddProgressTracker>((event, emit) async {
      emit(LoadingProgressTrackerState());

      final box = await hive.getProgressTrackerBox();

      final tracker = ProgressTrackerModel(
        projectId: const Uuid().v4(),
        projectName: event.projectName,
        totalPositions: event.totalPositions,
        currentPosition: event.currentPosition,
        projectType: event.projectType,
        trackingUnity: event.trackingUnity,
      );

      await box.put(tracker.projectId, tracker);

      emit(SuccessfullyCreatedProgressTrackerState());
    });

    on<DeleteAllTrackers>((event, emit) async {
      emit(LoadingProgressTrackerState());

      final box = await hive.getProgressTrackerBox();
      await box.clear();

      emit(DeletedAllProgressTrackersState());
    });
  }

  HiveDatasource get hive => HiveDatasource();
}
