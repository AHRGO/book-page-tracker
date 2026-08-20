part of 'progress_tracker_bloc.dart';

sealed class ProgressTrackerState extends Equatable {
  const ProgressTrackerState();

  @override
  List<Object> get props => [];
}

class InitialProgressTrackerState extends ProgressTrackerState {}

class LoadingProgressTrackerState extends ProgressTrackerState {}

class LoadedProgressTrackersListState extends ProgressTrackerState {
  final List<ProgressTrackerModel> progressTrackerList;

  const LoadedProgressTrackersListState({required this.progressTrackerList});

  @override
  List<Object> get props => [progressTrackerList];
}

class SuccessfullyCreatedProgressTrackerState extends ProgressTrackerState {}

class DeletedAllProgressTrackersState extends ProgressTrackerState {}
