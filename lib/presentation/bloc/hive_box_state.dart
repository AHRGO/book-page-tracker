part of 'hive_box_bloc.dart';

sealed class HiveBoxState extends Equatable {
  const HiveBoxState();

  @override
  List<Object> get props => [];
}

class HiveBoxInitalState extends HiveBoxState {}

class HiveBoxLoadingState extends HiveBoxState {}

//! todo: remove
class HiveBoxLoadedProgressTrackerBoxState extends HiveBoxState {
  final Box<ProgressTrackerModel> progressTrackerBox;

  const HiveBoxLoadedProgressTrackerBoxState({
    required this.progressTrackerBox,
  });

  @override
  List<Object> get props => [progressTrackerBox];
}

class HiveBoxLoadedProgressTrackersList extends HiveBoxState {
  final List<ProgressTrackerModel> progressTrackerList;

  const HiveBoxLoadedProgressTrackersList({required this.progressTrackerList});

  @override
  List<Object> get props => [progressTrackerList];
}
