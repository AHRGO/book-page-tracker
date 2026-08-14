import 'package:hive_ce_flutter/adapters.dart';

import '../models/progress_tracker_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<ProgressTrackerModel>()])
class HiveAdapters {}
