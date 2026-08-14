import 'package:flutter/material.dart';
// import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:progress_tracker/utils/logger_utils.dart';

import '../../datasources/hive_datasource.dart';
import '../../mock/page_tracker_mocked_list.dart';
// import '../../models/progress_tracker_model.dart';
import '../../utils/size_utils.dart';
import '../../widgets/app_screen.dart';

class HiveTestScreen extends StatefulWidget {
  const HiveTestScreen({super.key});

  @override
  State<HiveTestScreen> createState() => _HiveTestScreenState();
}

class _HiveTestScreenState extends State<HiveTestScreen> {
  // late Box<ProgressTrackerModel> box;
  int trackerCounter = 0;

  @override
  initState() {
    super.initState();
    // _initializeHive();
  }

  // Future<void> _initializeHive() async {
  //   final hive = HiveDatasource();
  //   box = await hive.getProgressTrackerBox();

  //   setState(() {});
  // }

  void _updateTrackerCounter() {
    if (trackerCounter >= (PageTrackerMockedList.list.length - 1)) return;
    setState(() {
      trackerCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hive = HiveDatasource();
    // Future<Box<ProgressTrackerModel>> box = hive.getProgressTrackerBox();

    final tracker = PageTrackerMockedList.list[trackerCounter];

    return AppScreen(
      child: Center(
        child: Column(
          spacing: SizeUtils.size24,
          children: [
            OutlinedButton(
              onPressed: () async {
                final box = await hive.getProgressTrackerBox();
                box.put(tracker.projectId, tracker);

                LoggerUtils.black.log(
                  ' O TRACKER DE  => ${tracker.projectName} FOI SALVO NO HIVE! ',
                );

                _updateTrackerCounter();
              },
              child: Text('Add'),
            ),
            OutlinedButton(
              onPressed: () async {
                final box = await hive.getProgressTrackerBox();

                final trackersList = box.values.toList();
                for (final track in trackersList) {
                  LoggerUtils.magenta.log('${track.projectName}');
                }

                // trackersList.map(
                //   (e) => LoggerUtils.magenta.log('\n${e.projectName}'),
                // );
              },
              child: Text('Get'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Update')),
            OutlinedButton(onPressed: () {}, child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
