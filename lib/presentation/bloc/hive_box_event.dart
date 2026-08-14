part of 'hive_box_bloc.dart';

sealed class HiveBoxEvent extends Equatable {
  const HiveBoxEvent();

  @override
  List<Object> get props => [];
}

class LoadProgressTrackerBox extends HiveBoxEvent {}

class LoadProgressTrackerList extends HiveBoxEvent {}

class DeleteAllTrackers extends HiveBoxEvent {}
