import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../models/progress_tracker_model.dart';

class HiveDatasource {
  const HiveDatasource();

  //! YAGNI
  Future<void> initHive() async {
    await openProgressTrackerBox();
    // await Hive.openBox<ProgressTrackerModel>('progress_tracker');
  }

  Future<Box<ProgressTrackerModel>> openProgressTrackerBox() async {
    return await Hive.openBox<ProgressTrackerModel>('progress_tracker');
  }

  Future<Box<ProgressTrackerModel>> getProgressTrackerBox() async {
    return await Hive.openBox<ProgressTrackerModel>('progress_tracker');

    // final box = await openProgressTrackerBox();

    // // if (box.)

    // return box;
  }
}
