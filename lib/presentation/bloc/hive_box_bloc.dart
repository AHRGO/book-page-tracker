import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../datasources/hive_datasource.dart';
import '../../models/progress_tracker_model.dart';

part 'hive_box_state.dart';
part 'hive_box_event.dart';

class HiveBoxBloc extends Bloc<HiveBoxEvent, HiveBoxState> {
  HiveBoxBloc() : super(HiveBoxInitalState()) {
    on<LoadProgressTrackerBox>((event, emit) async {
      emit(HiveBoxLoadingState());

      final box = await hive.getProgressTrackerBox();

      emit(HiveBoxLoadedProgressTrackerBoxState(progressTrackerBox: box));
    });

    on<LoadProgressTrackerList>((event, emit) async {
      emit(HiveBoxLoadingState());

      final box = await hive.getProgressTrackerBox();
      final trackersList = box.values.toList();

      emit(
        HiveBoxLoadedProgressTrackersList(progressTrackerList: trackersList),
      );
    });

    on<DeleteAllTrackers>((event, emit) async {
      emit(HiveBoxLoadingState());

      final box = await hive.getProgressTrackerBox();
      // box.deleteAll();
    });
  }

  HiveDatasource get hive => HiveDatasource();
}
