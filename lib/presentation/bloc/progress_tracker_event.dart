part of 'progress_tracker_bloc.dart';

sealed class ProgressTrackerEvent extends Equatable {
  const ProgressTrackerEvent();

  @override
  List<Object?> get props => [];
}

class LoadProgressTrackerList extends ProgressTrackerEvent {}

class AddProgressTracker extends ProgressTrackerEvent {
  final String projectName;
  final int totalPositions;
  final int currentPosition;
  final String? projectType;
  final String? trackingUnity;

  const AddProgressTracker({
    required this.projectName,
    required this.totalPositions,
    required this.currentPosition,
    this.projectType,
    this.trackingUnity,
  });

  @override
  List<Object?> get props => [
    projectName,
    totalPositions,
    currentPosition,
    projectType,
    trackingUnity,
  ];
}

class DeleteAllTrackers extends ProgressTrackerEvent {}
